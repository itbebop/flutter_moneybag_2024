import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String assetId,
    required String assetName,
    required String currency,
    required int isActiveAsset,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int firstColor,
    required int secondColor,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
