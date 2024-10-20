import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    final User? user,
  }) = _UserState;
}
