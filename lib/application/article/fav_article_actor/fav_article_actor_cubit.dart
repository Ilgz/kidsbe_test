import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article.dart';
import 'package:times_wire/domain/article/article_failure.dart';
import 'package:times_wire/domain/article/i_article_repository.dart';

part 'fav_article_actor_state.dart';
part 'fav_article_actor_cubit.freezed.dart';
@singleton
class FavArticleActorCubit extends Cubit<FavArticleActorState> {
  final IArticleRepository _articleRepository;
  FavArticleActorCubit(this._articleRepository) : super(const FavArticleActorState.initial());
  deleteFavArticle(Article article)async{
    emit(const FavArticleActorState.loadInProgress());
    final failureOrSuccess =
    await _articleRepository.deleteFavoriteArticle(article);
      emit(failureOrSuccess.fold(
              (f) => FavArticleActorState.deleteFavArticleFailure(f),
              (_) => const FavArticleActorState.deleteFavArticleSuccess()));
  }
  createFavArticle(Article article)async{
    emit(const FavArticleActorState.loadInProgress());
    final failureOrSuccess =
    await _articleRepository.createFavoriteArticle(article);
    emit(failureOrSuccess.fold(
            (f) => FavArticleActorState.createFavArticleFailure(f),
            (_) => const FavArticleActorState.createFavArticleSuccess()));
  }
}
