import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/domain/article/i_article_repository.dart';

part 'article_slider_watcher_cubit.freezed.dart';

part 'article_slider_watcher_state.dart';

@injectable
class ArticleSliderWatcherCubit extends Cubit<ArticleSliderWatcherState> {
  final IArticleRepository _docRepository;
  final FavArticleWatcherCubit favArticleCubit;

  ArticleSliderWatcherCubit(this._docRepository, this.favArticleCubit)
      : super(ArticleSliderWatcherState.initial());
  void init() {
    favArticleCubit.stream.listen((favArticleCubitState) {
      favArticleCubitState.maybeMap(loadSuccess: (successState) {
        _markFavoriteArticles(state.articles);
      }, orElse: () {});
    });
  }
  void getSliderArticles() async {
    emit(state.copyWith(isLoading:true));
    List<Article> updatedArticles = [];
    for (var category in ArticleCategoryEnum.values.map((e) => e.name)) {
      if (category != "home") {
        final articles = await _docRepository.getArticles(category);
        articles.fold((f) {}, (articles) {
          if(articles.isNotEmpty&&articles.first.title.isNotEmpty){
            updatedArticles.add(articles.first);
            _markFavoriteArticles(updatedArticles);
          }
        });
      }
    }
    emit(state.copyWith(isLoading:false));
  }

  void _markFavoriteArticles(List<Article> articles) {
    final List<String> favArticleUrlList = (favArticleCubit.state.maybeMap<List<Article>>(
        loadSuccess: (state) => state.articleList, orElse: () => [])).map((article) => article.url).toList();
    List<Article> updatedArticles = [];
    for (int i = 0; i < articles.length; i++) {
      if (favArticleUrlList.contains(articles[i].url)) {
        updatedArticles.add(articles[i].copyWith(isFavorite: true));
      } else {
        updatedArticles.add(articles[i].copyWith(isFavorite: false));
      }
    }
    emit(state.copyWith(articles: updatedArticles));
  }
}
