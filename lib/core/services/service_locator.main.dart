import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/dashboard/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/common/bloc/transection_card_index_cubit.dart';

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
  serviceLocator.registerFactory<CheckAuthStatusCubit>(
    () => CheckAuthStatusCubit(
      checkAuthStatusUsecase: serviceLocator<CheckAuthStatusUsecase>(),
      getCurrentUserUsecase: serviceLocator<GetCurrentUserUsecase>(),
    ),
  );
  serviceLocator.registerFactory<LoginCubit>(
    () => LoginCubit(lgoinUseCase: serviceLocator<LoginUseCase>()),
  );
  serviceLocator.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  serviceLocator.registerFactory<ShowPasswordCubit>(() => ShowPasswordCubit());
  serviceLocator.registerFactory<TransectionCardIndexCubit>(
    () => TransectionCardIndexCubit(),
  );
}
