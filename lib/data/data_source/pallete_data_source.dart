import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';

abstract interface class PalleteDataSource {
  Future<void> createUserPallete({required int userId});
  Future<List<UserPallete>> getUserPallete({required int userId});
  Future<void> updatePallete({required int userId, required UserPallete pallete});
}
