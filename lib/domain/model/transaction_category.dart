import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category.freezed.dart';
part 'transaction_category.g.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory({
    required int id, // 고유 ID
    required String name, // 유형 이름 (예: Salary, Rent 등)
    required String imgUrl,
    required AssetType type, // 수입 또는 지출에 대한 구분
  }) = _TransactionCategory;

  factory TransactionCategory.fromJson(Map<String, dynamic> json) => _$TransactionCategoryFromJson(json);
}
