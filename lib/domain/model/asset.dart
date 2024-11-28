import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required int assetId,
    required String assetName,
    required String currency,
    required int isActivated,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String firstColor,
    required String secondColor,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
