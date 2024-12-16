import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_detail.freezed.dart';
part 'transaction_detail.g.dart';

@freezed
class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    required int transactionId,
    required String memo,
    required double amount,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? imgUrl,
    required int categoryId,
    required int subCategoryId,
    required int userId,
    required int assetId,
    TransactionCategory? category,
  }) = _TransactionDetail;

  factory TransactionDetail.fromJson(Map<String, dynamic> json) => _$TransactionDetailFromJson(json);
}
