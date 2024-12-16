// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailImpl _$$TransactionDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailImpl(
      transactionId: (json['transactionId'] as num).toInt(),
      memo: json['memo'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imgUrl: json['imgUrl'] as String?,
      categoryId: (json['categoryId'] as num).toInt(),
      subCategoryId: (json['subCategoryId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      assetId: (json['assetId'] as num).toInt(),
      category: json['category'] == null
          ? null
          : TransactionCategory.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionDetailImplToJson(
        _$TransactionDetailImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'memo': instance.memo,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'imgUrl': instance.imgUrl,
      'categoryId': instance.categoryId,
      'subCategoryId': instance.subCategoryId,
      'userId': instance.userId,
      'assetId': instance.assetId,
      'category': instance.category,
    };
