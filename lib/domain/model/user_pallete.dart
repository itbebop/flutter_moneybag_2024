import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_pallete.freezed.dart';
part 'user_pallete.g.dart';

@freezed
class UserPallete with _$UserPallete {
  const factory UserPallete({
    required int colorId,
    required String hexaCode,
    required int colorOrder,
    required int userId,
  }) = _UserPallete;

  factory UserPallete.fromJson(Map<String, dynamic> json) => _$UserPalleteFromJson(json);
}
