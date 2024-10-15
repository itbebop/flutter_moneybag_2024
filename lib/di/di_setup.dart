import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/transaction_category_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/transaction_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/user_repository_impl.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/check_user_duplicated_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/create_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/get_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/login_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/logout_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/create_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/delete_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/get_transaction_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/update_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/create_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/delete_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/update_transaction_category_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // DataSource
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());
  getIt.registerSingleton<TransactionDataSource>(TransactionDataSourceImpl());
  getIt.registerSingleton<TransactionCategoryDataSource>(TransactionCategoryDataSourceImpl());

  // Repository
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userDataSource: getIt()));
  getIt.registerSingleton<TransactionRepository>(TransactionDetailRepositoryImpl(transactionDetailDataSource: getIt()));
  getIt.registerSingleton<TransactionCategoryRepository>(TransactionCategoryRepositoryImpl(transactionCategoryDataSource: getIt()));

  // Usecase
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(userRepository: getIt()));
  getIt.registerSingleton<LogoutUseCase>(LogoutUseCase(userRepository: getIt()));
  getIt.registerSingleton<CheckUserDuplicatedUseCase>(CheckUserDuplicatedUseCase(userRepository: getIt()));
  getIt.registerSingleton<CreateUserUseCase>(CreateUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<CreateTransactionUseCase>(CreateTransactionUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<DeleteTransactionUseCase>(DeleteTransactionUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<GetTransactionListUseCase>(GetTransactionListUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<UpdateTransactionUseCase>(UpdateTransactionUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<CreateTransactionCategoryUseCase>(CreateTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<DeleteTransactionCategoryUseCase>(DeleteTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<GetTransactionCategoryListUseCase>(GetTransactionCategoryListUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<UpdateTransactionCategoryUseCase>(UpdateTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
}
