// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDetailImpl _$$TransactionDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDetailImpl(
      transactionId: json['transactionId'] as String,
      memo: json['memo'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      amount: (json['amount'] as num).toDouble(),
      userId: json['userId'] as String,
      imgUrl: json['imgUrl'] as String,
      category: TransactionCategory.fromJson(
          json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionDetailImplToJson(
        _$TransactionDetailImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'memo': instance.memo,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'amount': instance.amount,
      'userId': instance.userId,
      'imgUrl': instance.imgUrl,
      'category': instance.category,
    };
