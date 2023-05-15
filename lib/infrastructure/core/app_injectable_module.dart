import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Scope(Environment.prod)
@module
abstract class AppInjectableProdModule {
  @lazySingleton
  http.Client get httpClient => http.Client();
  @lazySingleton
  FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
  @preResolve
  @Named("cachedArticleBox")
  Future<Box<ArticleList>> get cachedArticleBox =>
      Hive.openBox("cachedArticle");
  @preResolve
  @Named("favArticleUidBox")
  Future<Box<Article>> get favArticleBox =>
      Hive.openBox("favArticleUid");
  @preResolve
  Future<SharedPreferences> get sharedPreference =>
      SharedPreferences.getInstance();

}
