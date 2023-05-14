import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article.dart';

part 'article_searcher_state.dart';
part 'article_searcher_cubit.freezed.dart';
@injectable
class ArticleSearcherCubit extends Cubit<ArticleSearcherState> {
  ArticleSearcherCubit() : super( ArticleSearcherState.initial());
  void searchArticles(String query) {
    emit(state.copyWith(page:1,queriedArticles: state.initialArticles.where((chat) =>
        chat.title.toLowerCase().contains(query.toLowerCase())).toList(),query:query));
  }
  void updateArticles(List<Article> articles){
    emit(state.copyWith(initialArticles: articles,page: 1));
    searchArticles(state.query);
  }
  void nextPage(){
    emit(state.copyWith(page:state.page+1));
  }
  void previousPage(){
    emit(state.copyWith(page:state.page-1));
  }
}
