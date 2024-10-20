import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_detail.freezed.dart';
part 'transaction_detail.g.dart';

@freezed
class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    required String transactionId,
    required String memo,
    required DateTime createdAt,
    required DateTime updatedAt,
    required double amount,
    required String userId,
    required TransactionCategory category,
  }) = _TransactionDetail;

  factory TransactionDetail.fromJson(Map<String, dynamic> json) => _$TransactionDetailFromJson(json);
}
