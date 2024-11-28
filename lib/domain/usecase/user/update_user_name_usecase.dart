import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class UpdateUserNameUsecase {
  final UserRepository _userRepository;

  UpdateUserNameUsecase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<void> execute({required int userId, required String name}) async {
    await _userRepository.updateUserName(userId: userId, name: name);
  }
}
