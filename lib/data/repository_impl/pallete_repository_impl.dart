import 'package:flutter_moneybag_2024/data/data_source/pallete_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';
import 'package:flutter_moneybag_2024/domain/repository/pallete_repository.dart';

class PalleteRepositoryImpl implements PalleteRepository {
  final PalleteDataSource _palleteDataSource;

  PalleteRepositoryImpl({required PalleteDataSource palleteDataSource}) : _palleteDataSource = palleteDataSource;
  @override
  Future<void> createUserPallete({required int userId}) async {
    try {
      return await _palleteDataSource.createUserPallete(userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserPallete>> getUserPallete({required int userId}) async {
    List<UserPallete> colorList = await _palleteDataSource.getUserPallete(userId: userId);
    return colorList;
  }

  @override
  Future<void> updatePallete({required int userId, required UserPallete pallete}) async {
    await _palleteDataSource.updatePallete(userId: userId, pallete: pallete);
  }
}
