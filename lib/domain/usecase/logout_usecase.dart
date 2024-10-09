import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  LogoutUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<void> execute() async {
    await _userRepository.signOut();
  }
}
