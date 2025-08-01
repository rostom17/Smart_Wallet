import 'package:smart_wallet/features/auth/data/data_scources/auth_local_data_src.dart';
import 'package:smart_wallet/features/auth/data/data_scources/auth_local_data_src_impl.dart';
import 'package:smart_wallet/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:smart_wallet/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/check_auth_status_cubit.dart';

import 'service_locator.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  //local storeage
  serviceLocator.registerLazySingleton(
    () => FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock_this_device,
      ),
    ),
  );
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);

  //network clinet
  serviceLocator.registerSingleton(getDioInstance());
  serviceLocator.registerSingleton(ConnectivityChecker());
  serviceLocator.registerSingleton<ErrorMapper>(DefaultErrorMapper());
  serviceLocator.registerSingleton(AuthService());
  serviceLocator.registerSingleton(
    NetworkExecutor(
      dio: serviceLocator<Dio>(),
      connectivityChecker: serviceLocator(),
      errorMapper: serviceLocator(),
    ),
  );

  //data srouce implement
  serviceLocator.registerLazySingleton<AuthRemoteDataSrc>(
    () => AuthRemoteDataSrcImpl(networkExecutor: serviceLocator()),
  );
  serviceLocator.registerSingleton<AuthLocalDataSrc>(
    AuthLocalDataSrcImpl(
      secureStorage: serviceLocator(),
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSrc: serviceLocator(),
      authLocalDataSrc: serviceLocator(),
    ),
  );

  //UseCases
  serviceLocator.registerLazySingleton(
    () => LoginUseCase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => CheckAuthStatusUsecase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetCurrentUserUsecase(authRepository: serviceLocator()),
  );

  //Cubits
  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(lgoinUseCase: serviceLocator<LoginUseCase>()),
  );
  serviceLocator.registerFactory<CheckAuthStatusCubit>(
    () => CheckAuthStatusCubit(
      checkAuthStatusUsecase: serviceLocator<CheckAuthStatusUsecase>(),
      getCurrentUserUsecase: serviceLocator<GetCurrentUserUsecase>(),
    ),
  );
}
