import 'package:flutter_moneybag_2024/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<void> createUser({required User user});
  Future<void> signOut();
  Future<User> getUser({required String userId});
  Future<bool> checkDuplicatedUser({required String email});
  Future<void> updateUserName({required String userId, required String name});
  Future<void> updateLanguage({required String lang, required String userId});
  Future<void> updatePhoto({required String userId});
}
