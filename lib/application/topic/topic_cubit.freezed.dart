// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicState {
  List<String> get favoriteCategories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicStateCopyWith<TopicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicStateCopyWith<$Res> {
  factory $TopicStateCopyWith(
          TopicState value, $Res Function(TopicState) then) =
      _$TopicStateCopyWithImpl<$Res, TopicState>;
  @useResult
  $Res call({List<String> favoriteCategories});
}

/// @nodoc
class _$TopicStateCopyWithImpl<$Res, $Val extends TopicState>
    implements $TopicStateCopyWith<$Res> {
  _$TopicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteCategories = null,
  }) {
    return _then(_value.copyWith(
      favoriteCategories: null == favoriteCategories
          ? _value.favoriteCategories
          : favoriteCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicStateCopyWith<$Res>
    implements $TopicStateCopyWith<$Res> {
  factory _$$_TopicStateCopyWith(
          _$_TopicState value, $Res Function(_$_TopicState) then) =
      __$$_TopicStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> favoriteCategories});
}

/// @nodoc
class __$$_TopicStateCopyWithImpl<$Res>
    extends _$TopicStateCopyWithImpl<$Res, _$_TopicState>
    implements _$$_TopicStateCopyWith<$Res> {
  __$$_TopicStateCopyWithImpl(
      _$_TopicState _value, $Res Function(_$_TopicState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteCategories = null,
  }) {
    return _then(_$_TopicState(
      favoriteCategories: null == favoriteCategories
          ? _value._favoriteCategories
          : favoriteCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_TopicState implements _TopicState {
  _$_TopicState({required final List<String> favoriteCategories})
      : _favoriteCategories = favoriteCategories;

  final List<String> _favoriteCategories;
  @override
  List<String> get favoriteCategories {
    if (_favoriteCategories is EqualUnmodifiableListView)
      return _favoriteCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCategories);
  }

  @override
  String toString() {
    return 'TopicState(favoriteCategories: $favoriteCategories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicState &&
            const DeepCollectionEquality()
                .equals(other._favoriteCategories, _favoriteCategories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_favoriteCategories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicStateCopyWith<_$_TopicState> get copyWith =>
      __$$_TopicStateCopyWithImpl<_$_TopicState>(this, _$identity);
}

abstract class _TopicState implements TopicState {
  factory _TopicState({required final List<String> favoriteCategories}) =
      _$_TopicState;

  @override
  List<String> get favoriteCategories;
  @override
  @JsonKey(ignore: true)
  _$$_TopicStateCopyWith<_$_TopicState> get copyWith =>
      throw _privateConstructorUsedError;
}
