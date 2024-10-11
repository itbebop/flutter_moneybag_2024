import 'package:flutter_moneybag_2024/core/provider/user_state.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../domain/model/user.dart';

final userStateProvier = StateNotifierProvider<UserStateNotifier, UserState>((ref) => UserStateNotifier(UserState(
      getUserUseCase: getIt(),
    )));

class UserStateNotifier extends StateNotifier<UserState> {
  UserStateNotifier(super._state);

  Future<User> fetchUser() async {
    final user = await state.getUserUseCase.execute(userId: auth.FirebaseAuth.instance.currentUser!.uid);

    // 상태에 유저 저장
    state = state.copyWith(user: user);

    return user;
  }
}
