// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      imgUrl: json['imgUrl'] as String,
      language: json['language'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'imgUrl': instance.imgUrl,
      'language': instance.language,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'createAt': instance.createAt.toIso8601String(),
    };

const _$UserTypeEnumMap = {
  UserType.free: 'free',
  UserType.paid: 'paid',
  UserType.etc: 'etc',
};
