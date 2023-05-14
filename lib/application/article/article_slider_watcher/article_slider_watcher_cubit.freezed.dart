// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_slider_watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleSliderWatcherState {
  List<Article> get articles => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleSliderWatcherStateCopyWith<ArticleSliderWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleSliderWatcherStateCopyWith<$Res> {
  factory $ArticleSliderWatcherStateCopyWith(ArticleSliderWatcherState value,
          $Res Function(ArticleSliderWatcherState) then) =
      _$ArticleSliderWatcherStateCopyWithImpl<$Res, ArticleSliderWatcherState>;
  @useResult
  $Res call({List<Article> articles, bool isLoading});
}

/// @nodoc
class _$ArticleSliderWatcherStateCopyWithImpl<$Res,
        $Val extends ArticleSliderWatcherState>
    implements $ArticleSliderWatcherStateCopyWith<$Res> {
  _$ArticleSliderWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleSliderWatcherStateCopyWith<$Res>
    implements $ArticleSliderWatcherStateCopyWith<$Res> {
  factory _$$_ArticleSliderWatcherStateCopyWith(
          _$_ArticleSliderWatcherState value,
          $Res Function(_$_ArticleSliderWatcherState) then) =
      __$$_ArticleSliderWatcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Article> articles, bool isLoading});
}

/// @nodoc
class __$$_ArticleSliderWatcherStateCopyWithImpl<$Res>
    extends _$ArticleSliderWatcherStateCopyWithImpl<$Res,
        _$_ArticleSliderWatcherState>
    implements _$$_ArticleSliderWatcherStateCopyWith<$Res> {
  __$$_ArticleSliderWatcherStateCopyWithImpl(
      _$_ArticleSliderWatcherState _value,
      $Res Function(_$_ArticleSliderWatcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? isLoading = null,
  }) {
    return _then(_$_ArticleSliderWatcherState(
      null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ArticleSliderWatcherState implements _ArticleSliderWatcherState {
  const _$_ArticleSliderWatcherState(
      final List<Article> articles, this.isLoading)
      : _articles = articles;

  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'ArticleSliderWatcherState(articles: $articles, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleSliderWatcherState &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_articles), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleSliderWatcherStateCopyWith<_$_ArticleSliderWatcherState>
      get copyWith => __$$_ArticleSliderWatcherStateCopyWithImpl<
          _$_ArticleSliderWatcherState>(this, _$identity);
}

abstract class _ArticleSliderWatcherState implements ArticleSliderWatcherState {
  const factory _ArticleSliderWatcherState(
          final List<Article> articles, final bool isLoading) =
      _$_ArticleSliderWatcherState;

  @override
  List<Article> get articles;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleSliderWatcherStateCopyWith<_$_ArticleSliderWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
