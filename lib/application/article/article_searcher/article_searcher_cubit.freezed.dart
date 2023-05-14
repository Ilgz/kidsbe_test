// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_searcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleSearcherState {
  List<Article> get initialArticles => throw _privateConstructorUsedError;
  List<Article> get queriedArticles => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleSearcherStateCopyWith<ArticleSearcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleSearcherStateCopyWith<$Res> {
  factory $ArticleSearcherStateCopyWith(ArticleSearcherState value,
          $Res Function(ArticleSearcherState) then) =
      _$ArticleSearcherStateCopyWithImpl<$Res, ArticleSearcherState>;
  @useResult
  $Res call(
      {List<Article> initialArticles,
      List<Article> queriedArticles,
      String query,
      int page});
}

/// @nodoc
class _$ArticleSearcherStateCopyWithImpl<$Res,
        $Val extends ArticleSearcherState>
    implements $ArticleSearcherStateCopyWith<$Res> {
  _$ArticleSearcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialArticles = null,
    Object? queriedArticles = null,
    Object? query = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      initialArticles: null == initialArticles
          ? _value.initialArticles
          : initialArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      queriedArticles: null == queriedArticles
          ? _value.queriedArticles
          : queriedArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleSearcherStateCopyWith<$Res>
    implements $ArticleSearcherStateCopyWith<$Res> {
  factory _$$_ArticleSearcherStateCopyWith(_$_ArticleSearcherState value,
          $Res Function(_$_ArticleSearcherState) then) =
      __$$_ArticleSearcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Article> initialArticles,
      List<Article> queriedArticles,
      String query,
      int page});
}

/// @nodoc
class __$$_ArticleSearcherStateCopyWithImpl<$Res>
    extends _$ArticleSearcherStateCopyWithImpl<$Res, _$_ArticleSearcherState>
    implements _$$_ArticleSearcherStateCopyWith<$Res> {
  __$$_ArticleSearcherStateCopyWithImpl(_$_ArticleSearcherState _value,
      $Res Function(_$_ArticleSearcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialArticles = null,
    Object? queriedArticles = null,
    Object? query = null,
    Object? page = null,
  }) {
    return _then(_$_ArticleSearcherState(
      null == initialArticles
          ? _value._initialArticles
          : initialArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      null == queriedArticles
          ? _value._queriedArticles
          : queriedArticles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ArticleSearcherState implements _ArticleSearcherState {
  const _$_ArticleSearcherState(final List<Article> initialArticles,
      final List<Article> queriedArticles, this.query, this.page)
      : _initialArticles = initialArticles,
        _queriedArticles = queriedArticles;

  final List<Article> _initialArticles;
  @override
  List<Article> get initialArticles {
    if (_initialArticles is EqualUnmodifiableListView) return _initialArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_initialArticles);
  }

  final List<Article> _queriedArticles;
  @override
  List<Article> get queriedArticles {
    if (_queriedArticles is EqualUnmodifiableListView) return _queriedArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queriedArticles);
  }

  @override
  final String query;
  @override
  final int page;

  @override
  String toString() {
    return 'ArticleSearcherState(initialArticles: $initialArticles, queriedArticles: $queriedArticles, query: $query, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleSearcherState &&
            const DeepCollectionEquality()
                .equals(other._initialArticles, _initialArticles) &&
            const DeepCollectionEquality()
                .equals(other._queriedArticles, _queriedArticles) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_initialArticles),
      const DeepCollectionEquality().hash(_queriedArticles),
      query,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleSearcherStateCopyWith<_$_ArticleSearcherState> get copyWith =>
      __$$_ArticleSearcherStateCopyWithImpl<_$_ArticleSearcherState>(
          this, _$identity);
}

abstract class _ArticleSearcherState implements ArticleSearcherState {
  const factory _ArticleSearcherState(
      final List<Article> initialArticles,
      final List<Article> queriedArticles,
      final String query,
      final int page) = _$_ArticleSearcherState;

  @override
  List<Article> get initialArticles;
  @override
  List<Article> get queriedArticles;
  @override
  String get query;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleSearcherStateCopyWith<_$_ArticleSearcherState> get copyWith =>
      throw _privateConstructorUsedError;
}
