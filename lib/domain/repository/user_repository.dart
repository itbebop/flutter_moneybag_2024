import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';

abstract interface class UserRepository {
  Future<User?> login({required LoginPlatform platform});
  Future<bool> logout({required LoginPlatform platform});
  Future<void> signOut();

  Future<bool> createUser({required User user});
  Future<bool> isNewUser({required User user});
  Future<User> getUser({required String uid});
  Future<bool> updateUserName({required String userId, required String name});
  Future<void> updateColorList({required String userId, required User user});
  Future<void> updatePhoto({required String userId});
  Future<void> updateLanguage({required String lang, required String userId});
}
