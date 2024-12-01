import 'package:flutter_moneybag_2024/domain/repository/pallete_repository.dart';

class CreateUserPalleteUseCase {
  final PalleteRepository _palleteRepository;

  CreateUserPalleteUseCase({required PalleteRepository palleteRepository}) : _palleteRepository = palleteRepository;

  Future<void> execute({required int userId}) async {
    await _palleteRepository.createUserPallete(userId: userId);
  }
}
