import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    required String title,
    required String imgUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<User> user,
    required AssetType assetType,
  }) = _Asset;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
