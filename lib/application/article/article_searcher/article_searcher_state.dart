part of 'article_searcher_cubit.dart';


@freezed
class ArticleSearcherState with _$ArticleSearcherState {
  factory ArticleSearcherState.initial()=>const ArticleSearcherState([],[],"",1);
  const factory ArticleSearcherState(List<Article> initialArticles,List<Article> queriedArticles,String query,int page)= _ArticleSearcherState;
}
