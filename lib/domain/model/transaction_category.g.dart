// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryImpl _$$TransactionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryImpl(
      categoryId: json['categoryId'] as String,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      type: $enumDecode(_$AssetTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TransactionCategoryImplToJson(
        _$TransactionCategoryImpl instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'type': _$AssetTypeEnumMap[instance.type]!,
    };

const _$AssetTypeEnumMap = {
  AssetType.income: 'income',
  AssetType.expense: 'expense',
};
