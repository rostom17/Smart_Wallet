import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/config/app_routes.dart';
import 'package:smart_wallet/config/app_theme.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/other_option_cubit.dart';

void main() async {
  runApp(SmartWallet());
}

class SmartWallet extends StatelessWidget {
  const SmartWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
        BlocProvider<ShowPasswordCubit>(
          create: (_) => ShowPasswordCubit(),
          lazy: true,
        ),
        BlocProvider<OtherOptionCubit>(
          create: (_) => OtherOptionCubit(),
          lazy: true,
        ),
        
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: AppTheme.lightTheme(),
      ),
    );
  }
}
