import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';
import 'package:flutter_moneybag_2024/domain/repository/pallete_repository.dart';

class UpdateColorListUsecase {
  final PalleteRepository _palleteRepository;

  UpdateColorListUsecase({required PalleteRepository palleteRepository}) : _palleteRepository = palleteRepository;

  Future<void> execute({required int userId, required UserPallete pallete}) async {
    await _palleteRepository.updatePallete(userId: userId, pallete: pallete);
  }
}
