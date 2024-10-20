import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/create_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/check_user_duplicated_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/create_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/login_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/logout_usecase.dart';
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
    required final CreateAssetUseCase createAssetUseCase,
    required final GetAssetListUseCase getAssetListUseCase,
    final User? user,
  }) = _LoginScreenState;
}
