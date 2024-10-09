import 'package:flutter_moneybag_2024/domain/model/user.dart';

abstract interface class SocialAuth {
  Future<User?> login();
  Future<void> logout();
}
