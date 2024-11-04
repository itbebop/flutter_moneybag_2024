import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required double totalAmount,
    required double totalIncome,
    required double totalExpense,
    required String assetId,
    required String assetName,
    required bool isActiveAsset,
    required String currency,
    required List<String> userIdList,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<int> assetColor,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
