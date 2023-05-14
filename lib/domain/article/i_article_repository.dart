import 'package:dartz/dartz.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/domain/article/article_failure.dart';
import 'package:times_wire/domain/article/article.dart';

abstract class IArticleRepository {
  //articles
  Future<Either<ArticleFailure, List<Article>>> getArticles(String category);
  Future<Either<ArticleFailure,List<Article>>> getFavoriteArticleUrls();
  Future<Either<ArticleFailure, Unit>>createFavoriteArticle(Article article);
  Future<Either<ArticleFailure, Unit>>deleteFavoriteArticle(Article article);
  Future<Either<ArticleFailure, Unit>> cacheArticles(List<Article> articles,String category);

  //topics
  Future<Either<ArticleFailure, List<String>>> getFavoriteTopics();

  Future<Either<ArticleFailure, Unit>> createFavoriteTopic(
      ArticleCategoryEnum categoryEnum);

  Future<Either<ArticleFailure, Unit>> deleteFavoriteTopic(
      ArticleCategoryEnum categoryEnum);

//Search
// Future<Either<DocFailure, List<Result>>> searchArticles(String searchTerm,List<Article> articles);
// Future<Either<DocFailure, List<String>>> getSearchHistory();
// Future<Either<DocFailure, Unit>> addSearchHistory(String searchTerm);
// Future<Either<DocFailure, Unit>> deleteSearchHistory(String searchTerm);
// Future<Either<DocFailure, Unit>> clearSearchHistory();
}
