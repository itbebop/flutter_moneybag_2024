import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';

class GetUserPalleteUseCase {
  final UserRepository _userRepository;

  GetUserPalleteUseCase({required UserRepository userRepository}) : _userRepository = userRepository;

  Future<List<String>> execute({required int userId}) async {
    final result = await _userRepository.getUserPallete(userId: userId);
    return result;
  }
}
