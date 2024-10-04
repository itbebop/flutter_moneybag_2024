import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_detail.freezed.dart';

@freezed
class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    required String title,
    required String imgUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required double amount,
    required List<User> user,
    required AssetType assetType,
  }) = _TransactionDetail;
}
