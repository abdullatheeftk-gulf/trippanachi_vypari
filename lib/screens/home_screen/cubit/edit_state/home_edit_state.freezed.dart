// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEditState {
  Member? get member => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeEditStateCopyWith<HomeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEditStateCopyWith<$Res> {
  factory $HomeEditStateCopyWith(
          HomeEditState value, $Res Function(HomeEditState) then) =
      _$HomeEditStateCopyWithImpl<$Res, HomeEditState>;
  @useResult
  $Res call({Member? member});

  $MemberCopyWith<$Res>? get member;
}

/// @nodoc
class _$HomeEditStateCopyWithImpl<$Res, $Val extends HomeEditState>
    implements $HomeEditStateCopyWith<$Res> {
  _$HomeEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
  }) {
    return _then(_value.copyWith(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberCopyWith<$Res>? get member {
    if (_value.member == null) {
      return null;
    }

    return $MemberCopyWith<$Res>(_value.member!, (value) {
      return _then(_value.copyWith(member: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeEditStateImplCopyWith<$Res>
    implements $HomeEditStateCopyWith<$Res> {
  factory _$$HomeEditStateImplCopyWith(
          _$HomeEditStateImpl value, $Res Function(_$HomeEditStateImpl) then) =
      __$$HomeEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Member? member});

  @override
  $MemberCopyWith<$Res>? get member;
}

/// @nodoc
class __$$HomeEditStateImplCopyWithImpl<$Res>
    extends _$HomeEditStateCopyWithImpl<$Res, _$HomeEditStateImpl>
    implements _$$HomeEditStateImplCopyWith<$Res> {
  __$$HomeEditStateImplCopyWithImpl(
      _$HomeEditStateImpl _value, $Res Function(_$HomeEditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = freezed,
  }) {
    return _then(_$HomeEditStateImpl(
      member: freezed == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as Member?,
    ));
  }
}

/// @nodoc

class _$HomeEditStateImpl implements _HomeEditState {
  const _$HomeEditStateImpl({this.member = null});

  @override
  @JsonKey()
  final Member? member;

  @override
  String toString() {
    return 'HomeEditState(member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeEditStateImpl &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, member);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeEditStateImplCopyWith<_$HomeEditStateImpl> get copyWith =>
      __$$HomeEditStateImplCopyWithImpl<_$HomeEditStateImpl>(this, _$identity);
}

abstract class _HomeEditState implements HomeEditState {
  const factory _HomeEditState({final Member? member}) = _$HomeEditStateImpl;

  @override
  Member? get member;
  @override
  @JsonKey(ignore: true)
  _$$HomeEditStateImplCopyWith<_$HomeEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
