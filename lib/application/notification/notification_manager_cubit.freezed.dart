// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationManagerState {
  bool get isEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationManagerStateCopyWith<NotificationManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationManagerStateCopyWith<$Res> {
  factory $NotificationManagerStateCopyWith(NotificationManagerState value,
          $Res Function(NotificationManagerState) then) =
      _$NotificationManagerStateCopyWithImpl<$Res, NotificationManagerState>;
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class _$NotificationManagerStateCopyWithImpl<$Res,
        $Val extends NotificationManagerState>
    implements $NotificationManagerStateCopyWith<$Res> {
  _$NotificationManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(_value.copyWith(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationManagerStateCopyWith<$Res>
    implements $NotificationManagerStateCopyWith<$Res> {
  factory _$$_NotificationManagerStateCopyWith(
          _$_NotificationManagerState value,
          $Res Function(_$_NotificationManagerState) then) =
      __$$_NotificationManagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isEnabled});
}

/// @nodoc
class __$$_NotificationManagerStateCopyWithImpl<$Res>
    extends _$NotificationManagerStateCopyWithImpl<$Res,
        _$_NotificationManagerState>
    implements _$$_NotificationManagerStateCopyWith<$Res> {
  __$$_NotificationManagerStateCopyWithImpl(_$_NotificationManagerState _value,
      $Res Function(_$_NotificationManagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEnabled = null,
  }) {
    return _then(_$_NotificationManagerState(
      isEnabled: null == isEnabled
          ? _value.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NotificationManagerState implements _NotificationManagerState {
  _$_NotificationManagerState({required this.isEnabled});

  @override
  final bool isEnabled;

  @override
  String toString() {
    return 'NotificationManagerState(isEnabled: $isEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationManagerState &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEnabled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationManagerStateCopyWith<_$_NotificationManagerState>
      get copyWith => __$$_NotificationManagerStateCopyWithImpl<
          _$_NotificationManagerState>(this, _$identity);
}

abstract class _NotificationManagerState implements NotificationManagerState {
  factory _NotificationManagerState({required final bool isEnabled}) =
      _$_NotificationManagerState;

  @override
  bool get isEnabled;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationManagerStateCopyWith<_$_NotificationManagerState>
      get copyWith => throw _privateConstructorUsedError;
}
