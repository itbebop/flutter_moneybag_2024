import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/usecase/check_user_duplicated_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/create_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/login_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/logout_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_state.freezed.dart';

@freezed
class LoginScreenState with _$LoginScreenState {
  const factory LoginScreenState({
    @Default(false) final bool isLoading,
    @Default(false) final bool isNewUser,
    required final LoginUseCase loginUseCase,
    required final LogoutUseCase logoutUseCase,
    required final CheckUserDuplicatedUseCase checkUserDuplicatedUseCase,
    required final CreateUserUseCase createUserUseCase,
    final User? user,
  }) = _LoginScreenState;
}