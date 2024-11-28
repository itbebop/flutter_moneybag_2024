// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      assetId: (json['assetId'] as num).toInt(),
      assetName: json['assetName'] as String,
      currency: json['currency'] as String,
      isActivated: (json['isActivated'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      firstColor: json['firstColor'] as String,
      secondColor: json['secondColor'] as String,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'assetId': instance.assetId,
      'assetName': instance.assetName,
      'currency': instance.currency,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'firstColor': instance.firstColor,
      'secondColor': instance.secondColor,
    };
