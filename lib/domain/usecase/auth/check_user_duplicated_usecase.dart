import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class CheckUserDuplicatedUseCase {
  final UserRepository _userRepository;

  CheckUserDuplicatedUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<bool> execute({required User user}) async {
    final result = _userRepository.isNewUser(user: user);
    return result;
  }
}
