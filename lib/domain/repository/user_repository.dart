import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});
  Future<void> signOut();

  Future<bool> createUser({required User user});
  Future<bool> existUser({required String userId});
  Future<User> getUser({required String userId});
  Future<bool> updateUserName({required String userId, required String name});
  Future<void> updatePhoto({required String userId});
  Future<void> updateLanguage({required String lang, required String userId});
}