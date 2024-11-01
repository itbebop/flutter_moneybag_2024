import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/di/di_setup.dart';
import 'package:flutter_moneybag_2024/screen/login/login_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginScreenStateProvider = StateNotifierProvider<LoginScreenStateNotifier, LoginScreenState>((ref) => LoginScreenStateNotifier(LoginScreenState(
      loginUseCase: getIt(),
      logoutUseCase: getIt(),
      checkUserDuplicatedUseCase: getIt(),
      createUserUseCase: getIt(),
      createAssetUseCase: getIt(),
    )));

class LoginScreenStateNotifier extends StateNotifier<LoginScreenState> {
  LoginScreenStateNotifier(super.state);

  @override
  bool updateShouldNotify(old, current) {
    return super.updateShouldNotify(old, current); //
  }

  Future<void> login({required LoginPlatform platform}) async {
    state = state.copyWith(isLoading: true);

    final loginUseCase = state.loginUseCase;
    final bool isNewUser;
    try {
      state = state.copyWith(user: await loginUseCase.execute(platform: platform));
      isNewUser = await state.checkUserDuplicatedUseCase.execute(user: state.user!);
      if (isNewUser == true) {
        state = state.copyWith(isNewUser: true);
        await state.createUserUseCase.execute(user: state.user!);
        await state.createAssetUseCase.execute(userId: state.user!.userId);
      }
    } catch (e) {
      throw Exception(e);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> logout() async {
    await state.logoutUseCase.execute();
  }
}
