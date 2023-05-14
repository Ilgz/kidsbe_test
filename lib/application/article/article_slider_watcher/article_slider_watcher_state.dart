part of 'article_slider_watcher_cubit.dart';

@freezed
class ArticleSliderWatcherState with _$ArticleSliderWatcherState {
  const factory ArticleSliderWatcherState(List<Article> articles,bool isLoading)= _ArticleSliderWatcherState;
  factory ArticleSliderWatcherState.initial()=>const ArticleSliderWatcherState([],false);
}
