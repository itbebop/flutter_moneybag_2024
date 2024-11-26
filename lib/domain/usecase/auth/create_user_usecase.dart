import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;

  CreateUserUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<int> execute({required User user}) async {
    return await _userRepository.createUser(user: user);
  }
}
