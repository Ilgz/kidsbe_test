import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/application/article/fav_article_watcher/fav_article_watcher_cubit.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/domain/article/i_article_repository.dart';

part 'article_manager_cubit.freezed.dart';

part 'article_manager_state.dart';

@injectable
class ArticleManagerCubit extends Cubit<ArticleManagerState> {
  final IArticleRepository _docRepository;
  final FavArticleWatcherCubit favArticleCubit;

  ArticleManagerCubit(this._docRepository, this.favArticleCubit)
      : super(ArticleManagerState.initial());

  void init() {
    favArticleCubit.stream.listen((favArticleCubitState) {
      favArticleCubitState.maybeMap(
          loadSuccess: (successState) {
            _markFavoriteArticles(state.articles);
          },
          orElse: () {});
    });
  }

  Future<void> getArticles() async {
    emit(state.copyWith(isInProgress: true, page: 1, unexpectedError: false));
    final articles = await _docRepository.getArticles(state.category.name);
    articles.fold((f) => emit(state.copyWith(unexpectedError: true)),
        (articles) {
      _markFavoriteArticles(articles);
    });
    emit(state.copyWith(isInProgress: false, initialArticlesFetched: true));
  }

  void _markFavoriteArticles(List<Article> articles) {
    final List<String> favArticleUrlList = (favArticleCubit.state
        .maybeMap<List<Article>>(
            loadSuccess: (state) => state.articleList,
            orElse: () => [])).map((article) => article.url).toList();
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

  void categoryChanged(ArticleCategoryEnum docCategoryEnum) {
    emit(state.copyWith(category: docCategoryEnum));
    getArticles();
  }

  void nextPage() {
    emit(state.copyWith(page: state.page + 1));
  }

  void previousPage() {
    emit(state.copyWith(page: state.page - 1));
  }
}
