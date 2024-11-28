import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/get_user_pallete_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/get_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/logout_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/update_color_list_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) final bool isLoading,
    required GetUserUseCase getUserUseCase,
    required GetUserPalleteUseCase getUserPalleteUseCase,
    required UpdateColorListUsecase updateColorListUsecase,
    required LogoutUseCase logoutUseCase,
    required List<UserPallete> userColorList,
    final User? user,
  }) = _UserState;
}
