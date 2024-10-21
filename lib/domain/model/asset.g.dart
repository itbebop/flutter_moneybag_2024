// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AssetImpl _$$AssetImplFromJson(Map<String, dynamic> json) => _$AssetImpl(
      totalAmount: (json['totalAmount'] as num).toDouble(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpense: (json['totalExpense'] as num).toDouble(),
      assetId: json['assetId'] as String,
      assetName: json['assetName'] as String,
      imgUrl: json['imgUrl'] as String,
      currency: json['currency'] as String,
      userIdList: (json['userIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      assetColor: json['assetColor'] as String?,
    );

Map<String, dynamic> _$$AssetImplToJson(_$AssetImpl instance) =>
    <String, dynamic>{
      'totalAmount': instance.totalAmount,
      'totalIncome': instance.totalIncome,
      'totalExpense': instance.totalExpense,
      'assetId': instance.assetId,
      'assetName': instance.assetName,
      'imgUrl': instance.imgUrl,
      'currency': instance.currency,
      'userIdList': instance.userIdList,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'assetColor': instance.assetColor,
    };
