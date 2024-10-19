import 'package:flutter_moneybag_2024/domain/enums/user_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String userId,
    required String name,
    required String email,
    required String imgUrl,
    required String language,
    required UserType userType,
    required List<String> assetIdList,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
