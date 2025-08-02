import 'package:smart_wallet/features/auth/domain/usecases/signup_usecase.dart';

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

  //repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSrc: serviceLocator(),
      authLocalDataSrc: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(localDataSrc: serviceLocator()),
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
    () => GetCurrentUserUsecase(authRepository: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => LogoutUsecase(profileRepository: serviceLocator()),
  );

  //Cubits
  serviceLocator.registerLazySingleton<CheckAuthStatusCubit>(
    () => CheckAuthStatusCubit(
      checkAuthStatusUsecase: serviceLocator<CheckAuthStatusUsecase>(),
      getCurrentUserUsecase: serviceLocator<GetCurrentUserUsecase>(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      lgoinUseCase: serviceLocator<LoginUseCase>(),
      signupUseCase: serviceLocator<SignupUseCase>(),
    ),
  );
  serviceLocator.registerLazySingleton<BottomNavCubit>(() => BottomNavCubit());
  serviceLocator.registerLazySingleton<ShowPasswordCubit>(
    () => ShowPasswordCubit(),
  );
  serviceLocator.registerFactory<TransectionCardIndexCubit>(
    () => TransectionCardIndexCubit(),
  );
  serviceLocator.registerLazySingleton<LogoutCubit>(
    () => LogoutCubit(logoutUsecase: serviceLocator<LogoutUsecase>()),
  );
}
