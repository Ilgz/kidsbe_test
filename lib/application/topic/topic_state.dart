part of 'topic_cubit.dart';

@freezed
class TopicState with _$TopicState {
   factory TopicState.initial() => TopicState(favoriteCategories: []);
  factory TopicState({required List<String> favoriteCategories})=_TopicState;
}
