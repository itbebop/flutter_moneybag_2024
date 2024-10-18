import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/get_user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../domain/model/user.dart';

final userStateProvier = StateNotifierProvider<UserStateNotifier, AsyncValue<User>>((ref) => UserStateNotifier(getIt()));

class UserStateNotifier extends StateNotifier<AsyncValue<User>> {
  final GetUserUseCase getUserUseCase;

  UserStateNotifier(this.getUserUseCase) : super(const AsyncValue.loading());

  Future<void> fetchUser() async {
    try {
      state = const AsyncValue.loading(); // 로딩 상태로 변경

      final currentUser = auth.FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception("User is not logged in"); // 유저가 null인 경우 예외 처리
      }

      final user = await getUserUseCase.execute(userId: currentUser.uid);
      state = AsyncValue.data(user); // 성공적으로 데이터를 가져오면 상태 업데이트
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace); // 에러 발생 시 상태 업데이트
    }
  }
}
