import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/domain/article/article_failure.dart';
import 'package:times_wire/firebase_options.dart';
import 'package:times_wire/injection.dart';
import 'package:times_wire/presentation/article/article_page.dart';
import 'package:times_wire/presentation/core/widgets/app_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(MultimediaAdapter());
  Hive.registerAdapter(ArticleAdapter());
  await configureInjection(Environment.prod);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (!kIsWeb) {
    await _initNotifications();
    await Workmanager().initialize(callbackDispatcher);
    await Workmanager().registerPeriodicTask(
      "check_new_articles",
      "periodic_new_article_check",
      existingWorkPolicy: ExistingWorkPolicy.replace,
      frequency: Duration(hours: 1),
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }

  runApp(AppWidget(
    navigatorKey: navigatorKey,
  ));
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestPermission();
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: notificationTapBackground,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (context) =>
          ArticlePage(articleLink: notificationResponse.payload ?? "")));
}

Future<void> checkNewAndShowNotification() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final favTopics = sharedPreferences.getStringList("favTopics") ?? [];
  for (var favTopic in favTopics) {
    final articlesEither = await getArticles(favTopic);
    articlesEither.fold((_) {}, (articles) async {
      if (sharedPreferences.getString(favTopic) != articles.first.title) {
        if (sharedPreferences.getString(favTopic) != null) {
          showNotification(favTopic, articles.first.title, articles.first.url);
        }
        await sharedPreferences.setString(favTopic, articles.first.title);
      }
    });
  }
}

Future<void> showNotification(String topic, String body, String payload) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'article_notifications',
    'Article Notifications',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
      0,
      'New article is available for you. Topic is $topic',
      body,
      platformChannelSpecifics,
      payload: payload);
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'periodic_new_article_check':
        try {
          await checkNewAndShowNotification();
        } catch (err) {
          throw Exception(err);
        }
        break;
      default:
        return Future.value(false);
    }

    return Future.value(true);
  });
}

Future<Either<ArticleFailure, List<Article>>> getArticles(
    String category) async {
  try {
    final response = await http.get(Uri.parse(
        'https://api.nytimes.com/svc/topstories/v2/$category.json?api-key=vbxqbDJG068DqTLicxuJpWfAHgi15cQz'));
    if (response.statusCode == 200) {
      final List<Article> articles = ArticleCollection.fromJson(
              jsonDecode(utf8.decode(response.bodyBytes)))
          .results;
      return right(articles);
    } else {
      return left(ArticleFailure.unexpected());
    }
  } catch (e) {
    return left(ArticleFailure.unexpected());
  }
}
