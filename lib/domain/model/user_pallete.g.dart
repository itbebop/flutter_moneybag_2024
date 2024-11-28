// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_pallete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPalleteImpl _$$UserPalleteImplFromJson(Map<String, dynamic> json) =>
    _$UserPalleteImpl(
      colorId: (json['colorId'] as num).toInt(),
      hexaCode: json['hexaCode'] as String,
      colorOrder: (json['colorOrder'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$UserPalleteImplToJson(_$UserPalleteImpl instance) =>
    <String, dynamic>{
      'colorId': instance.colorId,
      'hexaCode': instance.hexaCode,
      'colorOrder': instance.colorOrder,
      'userId': instance.userId,
    };
