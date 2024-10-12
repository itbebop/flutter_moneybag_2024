// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryImpl _$$TransactionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: $enumDecode(_$AssetTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$TransactionCategoryImplToJson(
        _$TransactionCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AssetTypeEnumMap[instance.type]!,
    };

const _$AssetTypeEnumMap = {
  AssetType.income: 'income',
  AssetType.expense: 'expense',
};
