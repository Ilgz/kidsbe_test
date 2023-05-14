import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:times_wire/domain/article/article_categories.dart';
import 'package:times_wire/domain/article/i_article_repository.dart';

part 'topic_state.dart';
part 'topic_cubit.freezed.dart';
@injectable
class TopicCubit extends Cubit<TopicState> {
  final IArticleRepository _docRepository;
  TopicCubit(this._docRepository) : super( TopicState.initial());
  getFavCategories()async{
    final favoriteTopicsEither=await _docRepository.getFavoriteTopics();
    emit(favoriteTopicsEither.fold((f) => state,
            (categories) =>state.copyWith(favoriteCategories:categories)));
  }
  deleteFavCategory(ArticleCategoryEnum categoryEnum)async{
    await _docRepository.deleteFavoriteTopic(categoryEnum);
    getFavCategories();
  }
  createFavCategory(ArticleCategoryEnum categoryEnum)async{
    await _docRepository.createFavoriteTopic(categoryEnum);
    getFavCategories();
  }
}
