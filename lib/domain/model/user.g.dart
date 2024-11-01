// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      imgUrl: json['imgUrl'] as String,
      language: json['language'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      assetIdList: (json['assetIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      firstColorListSave: (json['firstColorListSave'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      secondColorListSave: (json['secondColorListSave'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'imgUrl': instance.imgUrl,
      'language': instance.language,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'assetIdList': instance.assetIdList,
      'firstColorListSave': instance.firstColorListSave,
      'secondColorListSave': instance.secondColorListSave,
    };

const _$UserTypeEnumMap = {
  UserType.free: 'free',
  UserType.paid: 'paid',
  UserType.etc: 'etc',
};
