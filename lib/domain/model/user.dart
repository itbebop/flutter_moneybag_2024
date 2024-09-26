import 'package:flutter_moneybag_2024/domain/enums/user_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int userId,
    required String name,
    required String imgUrl,
    required String language,
    required UserType userType,
  }) = _User;
}
