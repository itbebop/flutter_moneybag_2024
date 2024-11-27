import 'package:flutter_moneybag_2024/domain/model/user.dart';

abstract interface class UserDataSource {
  Future<int> createUser({required User user});
  Future<void> createUserPallete({required int userId});
  Future<void> signOut();
  Future<int> getUserFromFirebase({required String uid});
  Future<User> getUser({required String uid});
  Future<List<String>> getUserPallete({required int userId});
  Future<bool> isNewUser({required User user});
  Future<void> updateColorList({required int userId, required User user});
  Future<void> updateUserName({required int userId, required String name});
  Future<void> updateLanguage({required String lang, required int userId});
  Future<void> updatePhoto({required int userId});
}
