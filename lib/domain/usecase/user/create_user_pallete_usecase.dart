import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class CreateUserPalleteUseCase {
  final UserRepository _userRepository;

  CreateUserPalleteUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<void> execute({required int userId}) async {
    await _userRepository.createUserPallete(userId: userId);
  }
}
