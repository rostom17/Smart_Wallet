import 'service_locator.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() async {
  serviceLocator.registerSingleton(getDioInstance());
  serviceLocator.registerSingleton(ConnectivityChecker());
  serviceLocator.registerSingleton<ErrorMapper>(DefaultErrorMapper());
  serviceLocator.registerSingleton(AuthService());

  serviceLocator.registerLazySingleton(() => FlutterSecureStorage());
  final sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPref);

  serviceLocator.registerSingleton(
    NetworkExecutor(
      dio: serviceLocator<Dio>(),
      connectivityChecker: serviceLocator(),
      errorMapper: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthRemoteDataSrc>(
    () => AuthRemoteDataSrcImpl(
      networkExecutor: serviceLocator(),
      secureStorage: serviceLocator(),
      sharedPreferences: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSrc: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => LoginUseCase(authRepository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AuthCubit(lgoinUseCase: serviceLocator()),
  );
}
