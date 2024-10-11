import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/user_repository_impl.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';
import 'package:flutter_moneybag_2024/domain/usecase/check_user_duplicated_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/create_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/get_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/login_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/logout_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
// DataSource
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());

// Repository
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userDataSource: getIt()));

// Usecase
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(userRepository: getIt()));
  getIt.registerSingleton<LogoutUseCase>(LogoutUseCase(userRepository: getIt()));
  getIt.registerSingleton<CheckUserDuplicatedUseCase>(CheckUserDuplicatedUseCase(userRepository: getIt()));
  getIt.registerSingleton<CreateUserUseCase>(CreateUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase(userRepository: getIt()));
}
