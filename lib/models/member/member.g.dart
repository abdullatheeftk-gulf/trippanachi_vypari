// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      serialNo: json['serialNo'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      nomineeName: json['nomineeName'] as String?,
      nomineeRelation: json['nomineeRelation'] as String?,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serialNo': instance.serialNo,
      'name': instance.name,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'nomineeName': instance.nomineeName,
      'nomineeRelation': instance.nomineeRelation,
      'dateTime': instance.dateTime.toIso8601String(),
    };
