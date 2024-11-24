// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      imgUrl: json['imgUrl'] as String,
      language: json['language'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      createAt: DateTime.parse(json['createAt'] as String),
      isActivated: (json['isActivated'] as num).toInt(),
      unActivatedAt: json['unActivatedAt'] == null
          ? null
          : DateTime.parse(json['unActivatedAt'] as String),
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'imgUrl': instance.imgUrl,
      'language': instance.language,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'createAt': instance.createAt.toIso8601String(),
      'isActivated': instance.isActivated,
      'unActivatedAt': instance.unActivatedAt?.toIso8601String(),
      'uid': instance.uid,
    };

const _$UserTypeEnumMap = {
  UserType.free: 'free',
  UserType.paid: 'paid',
  UserType.etc: 'etc',
};
