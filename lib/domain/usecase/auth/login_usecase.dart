import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<User?> execute({required LoginPlatform platform}) async {
    final result = await _userRepository.login(platform: platform);
    return result;
  }
}
