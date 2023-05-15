import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/firebase_options.dart';
import 'package:times_wire/injection.dart';
import 'package:times_wire/presentation/core/widgets/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
   Hive.registerAdapter(MultimediaAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(ArticleListAdapter());
  await configureInjection(Environment.prod);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(AppWidget());
}
