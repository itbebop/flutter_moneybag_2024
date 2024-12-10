import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/asset_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/pallete_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/pallete_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/asset_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/pallete_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/transaction_category_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/transaction_repository_impl.dart';
import 'package:flutter_moneybag_2024/data/repository_impl/user_repository_impl.dart';
import 'package:flutter_moneybag_2024/domain/repository/asset_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/pallete_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_category_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/transaction_repository.dart';
import 'package:flutter_moneybag_2024/domain/repository/user_repository.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/change_actived_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/create_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/delete_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/get_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/init_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/asset/update_asset_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/check_user_duplicated_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/create_user_pallete_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/create_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/get_user_pallete_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/get_user_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/login_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/auth/logout_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/update_color_list_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/user/update_user_name_usecase.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/create_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/delete_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/get_transaction_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction/update_transaction_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/create_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/delete_transaction_category_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/get_transaction_category_list_use_case.dart';
import 'package:flutter_moneybag_2024/domain/usecase/transaction_category/update_transaction_category_user_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // DataSource
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());
  getIt.registerSingleton<AssetDataSource>(AssetDataSourceImpl());
  getIt.registerSingleton<TransactionDataSource>(TransactionDataSourceImpl());
  getIt.registerSingleton<TransactionCategoryDataSource>(TransactionCategoryDataSourceImpl());
  getIt.registerSingleton<PalleteDataSource>(PalleteDataSourceImpl());

  // Repository
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userDataSource: getIt()));
  getIt.registerSingleton<AssetRepository>(AssetRepositoryImpl(assetDetailDataSource: getIt()));
  getIt.registerSingleton<TransactionRepository>(TransactionRepositoryImpl(transactionDataSource: getIt()));
  getIt.registerSingleton<TransactionCategoryRepository>(TransactionCategoryRepositoryImpl(transactionCategoryDataSource: getIt()));
  getIt.registerSingleton<PalleteRepository>(PalleteRepositoryImpl(palleteDataSource: getIt()));

  // Usecase
  // user
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(userRepository: getIt()));
  getIt.registerSingleton<LogoutUseCase>(LogoutUseCase(userRepository: getIt()));
  getIt.registerSingleton<CheckUserDuplicatedUseCase>(CheckUserDuplicatedUseCase(userRepository: getIt()));
  getIt.registerSingleton<CreateUserUseCase>(CreateUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<GetUserUseCase>(GetUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<UpdateUserNameUsecase>(UpdateUserNameUsecase(userRepository: getIt()));
  getIt.registerSingleton<UpdateColorListUsecase>(UpdateColorListUsecase(palleteRepository: getIt()));
  // asset
  getIt.registerSingleton<InitAssetUseCase>(InitAssetUseCase(assetRepository: getIt()));
  getIt.registerSingleton<CreateAssetUseCase>(CreateAssetUseCase(assetRepository: getIt()));
  getIt.registerSingleton<DeleteAssetUseCase>(DeleteAssetUseCase(assetRepository: getIt()));
  getIt.registerSingleton<GetAssetListUseCase>(GetAssetListUseCase(assetRepository: getIt()));
  getIt.registerSingleton<GetAssetUseCase>(GetAssetUseCase(assetRepository: getIt()));
  getIt.registerSingleton<UpdateAssetUseCase>(UpdateAssetUseCase(assetRepository: getIt()));
  getIt.registerSingleton<ChangeActivedAssetUseCase>(ChangeActivedAssetUseCase(assetRepository: getIt()));
  // pallete
  getIt.registerSingleton<CreateUserPalleteUseCase>(CreateUserPalleteUseCase(palleteRepository: getIt()));
  getIt.registerSingleton<GetUserPalleteUseCase>(GetUserPalleteUseCase(palleteRepository: getIt()));
  // transaction
  getIt.registerSingleton<CreateTransactionUseCase>(CreateTransactionUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<DeleteTransactionUseCase>(DeleteTransactionUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<GetTransactionListUseCase>(GetTransactionListUseCase(transactionRepository: getIt()));
  getIt.registerSingleton<UpdateTransactionUseCase>(UpdateTransactionUseCase(transactionRepository: getIt()));
  // transaction category
  getIt.registerSingleton<CreateTransactionCategoryUseCase>(CreateTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<GetTransactionCategoryListUseCase>(GetTransactionCategoryListUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<GetTransactionCategoryUseCase>(GetTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<UpdateTransactionCategoryUseCase>(UpdateTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
  getIt.registerSingleton<DeleteTransactionCategoryUseCase>(DeleteTransactionCategoryUseCase(transactionCategoryRepository: getIt()));
}
