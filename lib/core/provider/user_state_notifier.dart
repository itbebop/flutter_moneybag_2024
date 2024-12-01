import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

final userStateProvider = StateNotifierProvider<UserStateNotifier, UserState>((ref) => UserStateNotifier(
      UserState(
        getUserUseCase: getIt(),
        getUserPalleteUseCase: getIt(),
        updateColorListUsecase: getIt(),
        logoutUseCase: getIt(),
        userColorList: [],
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
      final User user = await state.getUserUseCase.execute(uid: currentUser.uid);
      state = state.copyWith(user: user, isLoading: true);
      // fetch user하면서 pallete도 가져옴
      await getColorList(user.userId);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> logout() async {
    state = state.copyWith(user: null);
    await state.logoutUseCase.execute();
  }

  Future<void> getColorList(int userId) async {
    try {
      final List<UserPallete> colorList = await state.getUserPalleteUseCase.execute(userId: userId);
      state = state.copyWith(userColorList: colorList);
    } catch (e) {
      debugPrint('Error in user notifier getColorList: $e');
    }
  }

  Future<void> modifyColorList(
    List<Color> firstColorList,
    List<Color> secondColorList,
  ) async {
    // final firstColorListSave = colorToStringList(firstColorList);
    // final secondColorListSave = colorToStringList(secondColorList); // TODO: user_color테이블에 insert
    try {
      User newUser;
      if (state.user != null) {
        final user = state.user;
        newUser = User(
          userId: 0,
          uid: user!.uid,
          name: user.name,
          email: user.email,
          imgUrl: user.imgUrl,
          language: user.language,
          userType: user.userType,
          createdAt: DateTime.now(),
          isDeleted: 0,
        );
        // await state.updateColorListUsecase.execute(userId: 0, pallete: newUser);
      }
    } catch (e) {
      rethrow;
    }
  }
}

void showLogoutSnackbar(BuildContext context) {
  const snackBar = SnackBar(
    content: Text('로그아웃 되었습니다.'),
    duration: Duration(seconds: 2),
  );

  // ScaffoldMessenger를 사용하여 SnackBar를 화면에 띄웁니다.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
