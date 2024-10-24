import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

final userStateProvider = StateNotifierProvider<UserStateNotifier, UserState>((ref) => UserStateNotifier(
      UserState(
        getUserUseCase: getIt(),
        logoutUseCase: getIt(),
      ),
    ));

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier(super._state);

  Future<void> fetchUser() async {
    try {
      final currentUser = auth.FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User is not logged in"); // 유저가 null인 경우 예외 처리
      }

      final user = await state.getUserUseCase.execute(userId: currentUser.uid);
      state = state.copyWith(user: user, isLoading: true);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> logout() async {
    state = state.copyWith(user: null);
    await state.logoutUseCase.execute();
  }

  void showLogoutSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('로그아웃 되었습니다.'),
      duration: Duration(seconds: 2),
    );

    // ScaffoldMessenger를 사용하여 SnackBar를 화면에 띄웁니다.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
