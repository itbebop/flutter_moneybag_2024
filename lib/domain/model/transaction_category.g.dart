// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryImpl _$$TransactionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryImpl(
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      iconKey: json['iconKey'] as String,
      assetType: $enumDecode(_$AssetTypeEnumMap, json['assetType']),
      level: (json['level'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionCategoryImplToJson(
        _$TransactionCategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'iconKey': instance.iconKey,
      'assetType': _$AssetTypeEnumMap[instance.assetType]!,
      'level': instance.level,
      'userId': instance.userId,
    };

const _$AssetTypeEnumMap = {
  AssetType.total: 'total',
  AssetType.income: 'income',
  AssetType.expense: 'expense',
};
