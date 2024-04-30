// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_snackbar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSnackbar {
  String? get errorMessage => throw _privateConstructorUsedError;
  Color? get backgroundColor => throw _privateConstructorUsedError;
  Duration? get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSnackbarCopyWith<AppSnackbar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSnackbarCopyWith<$Res> {
  factory $AppSnackbarCopyWith(
          AppSnackbar value, $Res Function(AppSnackbar) then) =
      _$AppSnackbarCopyWithImpl<$Res, AppSnackbar>;
  @useResult
  $Res call({String? errorMessage, Color? backgroundColor, Duration? duration});
}

/// @nodoc
class _$AppSnackbarCopyWithImpl<$Res, $Val extends AppSnackbar>
    implements $AppSnackbarCopyWith<$Res> {
  _$AppSnackbarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? backgroundColor = freezed,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSnackbarImplCopyWith<$Res>
    implements $AppSnackbarCopyWith<$Res> {
  factory _$$AppSnackbarImplCopyWith(
          _$AppSnackbarImpl value, $Res Function(_$AppSnackbarImpl) then) =
      __$$AppSnackbarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, Color? backgroundColor, Duration? duration});
}

/// @nodoc
class __$$AppSnackbarImplCopyWithImpl<$Res>
    extends _$AppSnackbarCopyWithImpl<$Res, _$AppSnackbarImpl>
    implements _$$AppSnackbarImplCopyWith<$Res> {
  __$$AppSnackbarImplCopyWithImpl(
      _$AppSnackbarImpl _value, $Res Function(_$AppSnackbarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? backgroundColor = freezed,
    Object? duration = freezed,
  }) {
    return _then(_$AppSnackbarImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$AppSnackbarImpl implements _AppSnackbar {
  const _$AppSnackbarImpl(
      {this.errorMessage = null,
      this.backgroundColor = null,
      this.duration = null});

  @override
  @JsonKey()
  final String? errorMessage;
  @override
  @JsonKey()
  final Color? backgroundColor;
  @override
  @JsonKey()
  final Duration? duration;

  @override
  String toString() {
    return 'AppSnackbar(errorMessage: $errorMessage, backgroundColor: $backgroundColor, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSnackbarImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, errorMessage, backgroundColor, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSnackbarImplCopyWith<_$AppSnackbarImpl> get copyWith =>
      __$$AppSnackbarImplCopyWithImpl<_$AppSnackbarImpl>(this, _$identity);
}

abstract class _AppSnackbar implements AppSnackbar {
  const factory _AppSnackbar(
      {final String? errorMessage,
      final Color? backgroundColor,
      final Duration? duration}) = _$AppSnackbarImpl;

  @override
  String? get errorMessage;
  @override
  Color? get backgroundColor;
  @override
  Duration? get duration;
  @override
  @JsonKey(ignore: true)
  _$$AppSnackbarImplCopyWith<_$AppSnackbarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
