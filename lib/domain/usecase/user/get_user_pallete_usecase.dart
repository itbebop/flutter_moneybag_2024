import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';
import 'package:flutter_moneybag_2024/domain/repository/pallete_repository.dart';

class GetUserPalleteUseCase {
  final PalleteRepository _palleteRepository;

  GetUserPalleteUseCase({required PalleteRepository palleteRepository}) : _palleteRepository = palleteRepository;

  Future<List<UserPallete>> execute({required int userId}) async {
    try {
      final result = await _palleteRepository.getUserPallete(userId: userId);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
