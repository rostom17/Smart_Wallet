import 'package:smart_wallet/features/expense/data/datasource/expense_remote_data_src.dart';
import 'package:smart_wallet/features/expense/data/datasource/expense_remote_data_src_impl.dart';
import 'package:smart_wallet/features/expense/data/repositories/expense_repository_impl.dart';
import 'package:smart_wallet/features/expense/domain/repositories/expense_repository.dart';
import 'package:smart_wallet/features/expense/domain/usecases/add_expense_usecase.dart';
import 'package:smart_wallet/features/expense/domain/usecases/get_all_expense_usecase.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/add_expense_cubit.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/get_all_expense_cubit.dart';
import 'package:smart_wallet/features/profile/domain/usecases/get_current_user_usecase.dart';

import 'service_locator.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  //local storeage
  serviceLocator.registerSingleton(
    FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  );
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton(sharedPref);

  //network management
  serviceLocator.registerSingleton(getDioInstance());
  serviceLocator.registerSingleton(ConnectivityChecker());
  serviceLocator.registerSingleton<ErrorMapper>(DefaultErrorMapper());
  serviceLocator.registerSingleton(
    NetworkExecutor(
      dio: serviceLocator<Dio>(),
      connectivityChecker: serviceLocator(),
      errorMapper: serviceLocator(),
    ),
  );

  //data srouce implementation
  serviceLocator.registerLazySingleton<AuthRemoteDataSrc>(
    () => AuthRemoteDataSrcImpl(networkExecutor: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<AuthLocalDataSrc>(
    () => AuthLocalDataSrcImpl(
      secureStorage: serviceLocator<FlutterSecureStorage>(),
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileLocalDataSrc>(
    () => ProfileLocalDataSrcImpl(
      secureStorage: serviceLocator<FlutterSecureStorage>(),
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRemoteDataSrc>(
    () => ProfileRemoteDataSrcImpl(networkExecutor: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<ExpenseRemoteDataSource>(
    () => ExpenseRemoteDataSrcImpl(networkExecutor: serviceLocator()),
  );

  //repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSrc: serviceLocator(),
      authLocalDataSrc: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      localDataSrc: serviceLocator(),
      remoteDataSrc: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ExpenseRepository>(
    () => ExpenseRepositoryImpl(expenseRemoteDataSource: serviceLocator()),
  );

  //UseCases
  serviceLocator.registerLazySingleton(
    () => LoginUseCase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => SignupUseCase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => CheckAuthStatusUsecase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => LogoutUsecase(profileRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCurrentUserUsecase(profileRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetAllExpenseUsecase(expenseRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => AddExpenseUsecase(expenseRepository: serviceLocator()),
  );

  //Cubits
  serviceLocator.registerLazySingleton<CheckAuthStatusCubit>(
    () => CheckAuthStatusCubit(
      checkAuthStatusUsecase: serviceLocator<CheckAuthStatusUsecase>(),
    ),
  );
  serviceLocator.registerLazySingleton<LoginCubit>(
    () => LoginCubit(lgoinUseCase: serviceLocator<LoginUseCase>()),
  );
  serviceLocator.registerFactory<SignupCubit>(
    () => SignupCubit(signupUseCase: serviceLocator<SignupUseCase>()),
  );
  serviceLocator.registerLazySingleton<LogoutCubit>(
    () => LogoutCubit(logoutUsecase: serviceLocator<LogoutUsecase>()),
  );
  serviceLocator.registerLazySingleton<ProfileDataCubit>(
    () => ProfileDataCubit(
      getCurrentUserUsecase: serviceLocator<GetCurrentUserUsecase>(),
    ),
  );
  serviceLocator.registerFactory<GetAllExpenseCubit>(
    () => GetAllExpenseCubit(getAllExpenseUsecase: serviceLocator()),
  );
  serviceLocator.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());
  serviceLocator.registerLazySingleton<ShowPasswordCubit>(
    () => ShowPasswordCubit(),
  );
  serviceLocator.registerFactory<ChooseTransectionCubit>(
    () => ChooseTransectionCubit(),
  );
  serviceLocator.registerFactory<AddExpenseCubit>(
    () => AddExpenseCubit(addExpenseUsecase: serviceLocator()),
  );
}
