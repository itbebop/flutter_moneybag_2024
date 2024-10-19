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
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      amount: (json['amount'] as num).toDouble(),
      email: (json['email'] as List<dynamic>).map((e) => e as String).toList(),
      category: TransactionCategory.fromJson(
          json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionDetailImplToJson(
        _$TransactionDetailImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'memo': instance.memo,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'amount': instance.amount,
      'email': instance.email,
      'category': instance.category,
    };
