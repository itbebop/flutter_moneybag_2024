import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/auth/google_auth.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/auth/kakao_auth.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl({required UserDataSource userDataSource}) : _userDataSource = userDataSource;

  @override
  Future<User?> login({required LoginPlatform platform}) async {
    User? result;
    try {
      switch (platform) {
        case LoginPlatform.google:
          result = await GoogleAuth().login();
        case LoginPlatform.kakao:
          result = await KakaoAuth().login();
        case LoginPlatform.apple:
        // TODO: Handle this case.
      }
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> logout({required LoginPlatform platform}) async {
    bool result = false;
    switch (platform) {
      case LoginPlatform.google:
        await GoogleAuth().logout();
      case LoginPlatform.kakao:
        await KakaoAuth().logout();
      case LoginPlatform.apple:
      // TODO: Handle this case.
    }
    await auth.FirebaseAuth.instance.signOut();
    return result;
  }

  @override
  Future<void> signOut() async {
    await _userDataSource.signOut();
  }

  @override
  Future<bool> createUser({required User user}) async {
    try {
      await _userDataSource.createUser(user: user);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isNewUser({required User user}) async {
    return await _userDataSource.isNewUser(user: user);
  }

  @override
  Future<User> getUser({required String uid}) async {
    User user;
    try {
      user = await _userDataSource.getUser(uid: uid);
    } catch (error) {
      rethrow;
    }
    return user;
  }

  @override
  Future<bool> updateUserName({required String userId, required String name}) async {
    bool result = false;
    try {
      await _userDataSource.updateUserName(userId: userId, name: name);
      result = true;
    } catch (error) {
      result = false;
    }
    return result;
  }

  @override
  Future<void> updateColorList({required String userId, required User user}) async {
    await _userDataSource.updateColorList(userId: userId, user: user);
  }

  @override
  Future<void> updatePhoto({required String userId}) async {
    await _userDataSource.updatePhoto(userId: userId);
  }

  @override
  Future<void> updateLanguage({required String lang, required String userId}) async {
    await _userDataSource.updateLanguage(lang: lang, userId: userId);
  }
}
