// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleManagerState {
  bool get isInProgress => throw _privateConstructorUsedError;
  bool get unexpectedError => throw _privateConstructorUsedError;
  List<Article> get articles => throw _privateConstructorUsedError;
  ArticleCategoryEnum get category => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get initialArticlesFetched => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleManagerStateCopyWith<ArticleManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleManagerStateCopyWith<$Res> {
  factory $ArticleManagerStateCopyWith(
          ArticleManagerState value, $Res Function(ArticleManagerState) then) =
      _$ArticleManagerStateCopyWithImpl<$Res, ArticleManagerState>;
  @useResult
  $Res call(
      {bool isInProgress,
      bool unexpectedError,
      List<Article> articles,
      ArticleCategoryEnum category,
      int page,
      bool initialArticlesFetched});
}

/// @nodoc
class _$ArticleManagerStateCopyWithImpl<$Res, $Val extends ArticleManagerState>
    implements $ArticleManagerStateCopyWith<$Res> {
  _$ArticleManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInProgress = null,
    Object? unexpectedError = null,
    Object? articles = null,
    Object? category = null,
    Object? page = null,
    Object? initialArticlesFetched = null,
  }) {
    return _then(_value.copyWith(
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      unexpectedError: null == unexpectedError
          ? _value.unexpectedError
          : unexpectedError // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ArticleCategoryEnum,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      initialArticlesFetched: null == initialArticlesFetched
          ? _value.initialArticlesFetched
          : initialArticlesFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocWatcherStateCopyWith<$Res>
    implements $ArticleManagerStateCopyWith<$Res> {
  factory _$$_DocWatcherStateCopyWith(
          _$_DocWatcherState value, $Res Function(_$_DocWatcherState) then) =
      __$$_DocWatcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isInProgress,
      bool unexpectedError,
      List<Article> articles,
      ArticleCategoryEnum category,
      int page,
      bool initialArticlesFetched});
}

/// @nodoc
class __$$_DocWatcherStateCopyWithImpl<$Res>
    extends _$ArticleManagerStateCopyWithImpl<$Res, _$_DocWatcherState>
    implements _$$_DocWatcherStateCopyWith<$Res> {
  __$$_DocWatcherStateCopyWithImpl(
      _$_DocWatcherState _value, $Res Function(_$_DocWatcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isInProgress = null,
    Object? unexpectedError = null,
    Object? articles = null,
    Object? category = null,
    Object? page = null,
    Object? initialArticlesFetched = null,
  }) {
    return _then(_$_DocWatcherState(
      isInProgress: null == isInProgress
          ? _value.isInProgress
          : isInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      unexpectedError: null == unexpectedError
          ? _value.unexpectedError
          : unexpectedError // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ArticleCategoryEnum,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      initialArticlesFetched: null == initialArticlesFetched
          ? _value.initialArticlesFetched
          : initialArticlesFetched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DocWatcherState implements _DocWatcherState {
  _$_DocWatcherState(
      {required this.isInProgress,
      required this.unexpectedError,
      required final List<Article> articles,
      required this.category,
      required this.page,
      required this.initialArticlesFetched})
      : _articles = articles;

  @override
  final bool isInProgress;
  @override
  final bool unexpectedError;
  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final ArticleCategoryEnum category;
  @override
  final int page;
  @override
  final bool initialArticlesFetched;

  @override
  String toString() {
    return 'ArticleManagerState(isInProgress: $isInProgress, unexpectedError: $unexpectedError, articles: $articles, category: $category, page: $page, initialArticlesFetched: $initialArticlesFetched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocWatcherState &&
            (identical(other.isInProgress, isInProgress) ||
                other.isInProgress == isInProgress) &&
            (identical(other.unexpectedError, unexpectedError) ||
                other.unexpectedError == unexpectedError) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.initialArticlesFetched, initialArticlesFetched) ||
                other.initialArticlesFetched == initialArticlesFetched));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isInProgress,
      unexpectedError,
      const DeepCollectionEquality().hash(_articles),
      category,
      page,
      initialArticlesFetched);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocWatcherStateCopyWith<_$_DocWatcherState> get copyWith =>
      __$$_DocWatcherStateCopyWithImpl<_$_DocWatcherState>(this, _$identity);
}

abstract class _DocWatcherState implements ArticleManagerState {
  factory _DocWatcherState(
      {required final bool isInProgress,
      required final bool unexpectedError,
      required final List<Article> articles,
      required final ArticleCategoryEnum category,
      required final int page,
      required final bool initialArticlesFetched}) = _$_DocWatcherState;

  @override
  bool get isInProgress;
  @override
  bool get unexpectedError;
  @override
  List<Article> get articles;
  @override
  ArticleCategoryEnum get category;
  @override
  int get page;
  @override
  bool get initialArticlesFetched;
  @override
  @JsonKey(ignore: true)
  _$$_DocWatcherStateCopyWith<_$_DocWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}
