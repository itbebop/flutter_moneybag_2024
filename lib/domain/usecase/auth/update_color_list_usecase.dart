import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class UpdateColorListUsecase {
  final UserRepository _userRepository;

  UpdateColorListUsecase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<void> execute({required String userId, required User user}) async {
    await _userRepository.updateColorList(userId: userId, user: user);
  }
}
