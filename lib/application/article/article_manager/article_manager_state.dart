part of 'article_manager_cubit.dart';


@freezed
class ArticleManagerState with _$ArticleManagerState {
  factory ArticleManagerState.initial() => ArticleManagerState(isInProgress: false,unexpectedError: false,articles: [],category:ArticleCategoryEnum.values.first,page: 1, initialArticlesFetched: false);

  factory ArticleManagerState({required bool  isInProgress,required bool unexpectedError,required List<Article> articles,required ArticleCategoryEnum category,required int page,required bool initialArticlesFetched})=_DocWatcherState;
}

