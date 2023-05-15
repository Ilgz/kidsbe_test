import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/domain/article/article_failure.dart';
import 'package:times_wire/domain/article/i_article_repository.dart';

@LazySingleton(as: IArticleRepository)
class ArticleRepository implements IArticleRepository {
  final Box<Article> _favArticleBox;
  final Box<ArticleList> _cachedArticleBox;
  final SharedPreferences _sharedPreferences;
  final FirebaseMessaging _firebaseMessaging;

  ArticleRepository(
      @Named("favArticleUidBox") this._favArticleBox,
      @Named("cachedArticleBox") this._cachedArticleBox,
      this._sharedPreferences,
      this._firebaseMessaging);

  @override
  Future<Either<ArticleFailure, List<Article>>> getArticles(
      String category) async {
    try {
      if (kIsWeb || (await InternetConnectionChecker().hasConnection)) {
        final response = await http.get(Uri.parse(
            'https://api.nytimes.com/svc/topstories/v2/$category.json?api-key=vbxqbDJG068DqTLicxuJpWfAHgi15cQz'));
        if (response.statusCode == 200) {
          final List<Article> articles = ArticleCollection.fromJson(
                  jsonDecode(utf8.decode(response.bodyBytes)))
              .results;
          await cacheArticles(articles, category);
          return right(articles);
        } else if (response.statusCode == 429) {
          try{
            return right(_cachedArticleBox.get(category)!.articleList);
          }catch(e){
            return right(<Article>[]);
          }
        } else {
          return left(ArticleFailure.unexpected());
        }
      } else {
        try{
          return right(_cachedArticleBox.get(category)!.articleList);
        }catch(e){
          return right(<Article>[]);
        }
      }
    } catch (e) {
      return left(ArticleFailure.unexpected());
    }
  }

  void _subscribeToTopic(String topicName) {
    FirebaseMessaging.instance.subscribeToTopic(topicName);
  }

  void _unsubscribeFromTopic(String topicName) {
    FirebaseMessaging.instance.unsubscribeFromTopic(topicName);
  }

  @override
  Future<Either<ArticleFailure, Unit>> cacheArticles(
      List<Article> articles, String category) async {
    try {
      await _cachedArticleBox.put(category, ArticleList(articles));
      return right(unit);
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> createFavoriteTopic(
      ArticleCategoryEnum categoryEnum) async {
    try {
      final favoritesEither = await getFavoriteTopics();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        if (!favorites.contains(categoryEnum.name)) {
          List<String>? favTopics =
              _sharedPreferences.getStringList("favTopics");
          if (favTopics == null) {
            favTopics = [categoryEnum.name];
          } else {
            favTopics.add(categoryEnum.name);
          }
          await _sharedPreferences.setStringList("favTopics", favTopics);
        }
        _subscribeToTopic(categoryEnum.name);
        return right(unit);
      });
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteFavoriteTopic(
      ArticleCategoryEnum categoryEnum) async {
    try {
      final favoritesEither = await getFavoriteTopics();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        int index = favorites.indexWhere((e) => e == categoryEnum.name);
        if (index == -1) {
          return left(const ArticleFailure.unexpected());
        }
        List<String>? favTopics = _sharedPreferences.getStringList("favTopics");
        if (favTopics != null && index >= 0 && index < favTopics.length) {
          favTopics.removeAt(index);
          await _sharedPreferences.setStringList("favTopics", favTopics);
        }
        _unsubscribeFromTopic(categoryEnum.name);
        return right(unit);
      });
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<String>>> getFavoriteTopics() async {
    final articles = _sharedPreferences.getStringList("favTopics") ?? [];
    return right(articles);
  }

  @override
  Future<Either<ArticleFailure, Unit>> createFavoriteArticle(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticleUrls();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        if (!(favorites.map((article) => article.url)).contains(article.url)) {
          await _favArticleBox.add(article);
        }
        return right(unit);
      });
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, Unit>> deleteFavoriteArticle(
      Article article) async {
    try {
      final favoritesEither = await getFavoriteArticleUrls();
      return favoritesEither.fold((failure) {
        return left(failure);
      }, (favorites) async {
        int index = favorites.indexWhere((e) => e.url == article.url);
        if (index == -1) {
          return left(const ArticleFailure.unexpected());
        }
        await _favArticleBox.deleteAt(index);
        return right(unit);
      });
    } on HiveError {
      return left(const ArticleFailure.unexpected());
    }
  }

  @override
  Future<Either<ArticleFailure, List<Article>>> getFavoriteArticleUrls() async {
    final favArticleUrls = _favArticleBox.values.toList();
    return right(favArticleUrls);
  }
}
