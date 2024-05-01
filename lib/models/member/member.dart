import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {

   factory Member({
    @Default(0) int id,
    required String serialNo,
    required String name,
    required String? address,
    required String? phoneNumber,
    required String? nomineeName,
    required String? nomineeRelation,
    required DateTime dateTime,
  }) = _Member;

  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}