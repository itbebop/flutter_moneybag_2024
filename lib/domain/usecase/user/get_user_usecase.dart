import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  GetUserUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<User> execute({required String uid}) async {
    final result = await _userRepository.getUser(uid: uid);
    return result;
  }
}
