// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Member _$MemberFromJson(Map<String, dynamic> json) {
  return _Member.fromJson(json);
}

/// @nodoc
mixin _$Member {
  int get id => throw _privateConstructorUsedError;
  String get serialNo => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get nomineeName => throw _privateConstructorUsedError;
  String? get nomineeRelation => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberCopyWith<Member> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberCopyWith<$Res> {
  factory $MemberCopyWith(Member value, $Res Function(Member) then) =
      _$MemberCopyWithImpl<$Res, Member>;
  @useResult
  $Res call(
      {int id,
      String serialNo,
      String name,
      String? address,
      String? phoneNumber,
      String? nomineeName,
      String? nomineeRelation,
      DateTime dateTime});
}

/// @nodoc
class _$MemberCopyWithImpl<$Res, $Val extends Member>
    implements $MemberCopyWith<$Res> {
  _$MemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serialNo = null,
    Object? name = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? nomineeName = freezed,
    Object? nomineeRelation = freezed,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      nomineeName: freezed == nomineeName
          ? _value.nomineeName
          : nomineeName // ignore: cast_nullable_to_non_nullable
              as String?,
      nomineeRelation: freezed == nomineeRelation
          ? _value.nomineeRelation
          : nomineeRelation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> implements $MemberCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String serialNo,
      String name,
      String? address,
      String? phoneNumber,
      String? nomineeName,
      String? nomineeRelation,
      DateTime dateTime});
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? serialNo = null,
    Object? name = null,
    Object? address = freezed,
    Object? phoneNumber = freezed,
    Object? nomineeName = freezed,
    Object? nomineeRelation = freezed,
    Object? dateTime = null,
  }) {
    return _then(_$MemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      serialNo: null == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      nomineeName: freezed == nomineeName
          ? _value.nomineeName
          : nomineeName // ignore: cast_nullable_to_non_nullable
              as String?,
      nomineeRelation: freezed == nomineeRelation
          ? _value.nomineeRelation
          : nomineeRelation // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl implements _Member {
  _$MemberImpl(
      {this.id = 0,
      required this.serialNo,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.nomineeName,
      required this.nomineeRelation,
      required this.dateTime});

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String serialNo;
  @override
  final String name;
  @override
  final String? address;
  @override
  final String? phoneNumber;
  @override
  final String? nomineeName;
  @override
  final String? nomineeRelation;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'Member(id: $id, serialNo: $serialNo, name: $name, address: $address, phoneNumber: $phoneNumber, nomineeName: $nomineeName, nomineeRelation: $nomineeRelation, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.nomineeName, nomineeName) ||
                other.nomineeName == nomineeName) &&
            (identical(other.nomineeRelation, nomineeRelation) ||
                other.nomineeRelation == nomineeRelation) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, serialNo, name, address,
      phoneNumber, nomineeName, nomineeRelation, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      __$$MemberImplCopyWithImpl<_$MemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class _Member implements Member {
  factory _Member(
      {final int id,
      required final String serialNo,
      required final String name,
      required final String? address,
      required final String? phoneNumber,
      required final String? nomineeName,
      required final String? nomineeRelation,
      required final DateTime dateTime}) = _$MemberImpl;

  factory _Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;

  @override
  int get id;
  @override
  String get serialNo;
  @override
  String get name;
  @override
  String? get address;
  @override
  String? get phoneNumber;
  @override
  String? get nomineeName;
  @override
  String? get nomineeRelation;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$MemberImplCopyWith<_$MemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
