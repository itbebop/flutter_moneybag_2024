// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryImpl _$$TransactionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imgUrl: json['imgUrl'] as String,
      type: $enumDecode(_$AssetTypeEnumMap, json['type']),
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$$TransactionCategoryImplToJson(
        _$TransactionCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgUrl': instance.imgUrl,
      'type': _$AssetTypeEnumMap[instance.type]!,
      'userId': instance.userId,
    };

const _$AssetTypeEnumMap = {
  AssetType.income: 'income',
  AssetType.expense: 'expense',
};
