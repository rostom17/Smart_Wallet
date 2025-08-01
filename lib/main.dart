import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/services/bloc_providers.dart';
import 'package:smart_wallet/core/services/service_locator.main.dart';
import 'package:smart_wallet/core/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  runApp(SmartWallet());
}

class SmartWallet extends StatelessWidget {
  const SmartWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.blocProviders,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: AppTheme.lightTheme(),
      ),
    );
  }
}
