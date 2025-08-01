import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/check_auth_status_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final CheckAuthStatusCubit _checkAuthStatusCubit;

  @override
  void initState() {
    _checkAuthStatusCubit = GetIt.I<CheckAuthStatusCubit>();
    _checkAuthStatus();
    super.initState();
  }

  void _checkAuthStatus() {
    _checkAuthStatusCubit.checkStatus().then((isAuthenticated) {
      _navigateBasedOnAuth(isAuthenticated);
    });
  }

  void _navigateBasedOnAuth(bool isAuthenticated) {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      if (mounted) {
        if (isAuthenticated) {
          context.pushReplacementNamed(AppRoutes.bottomNavScreen);
        } else {
          context.pushReplacementNamed(AppRoutes.loginScreen);
        }
      }
    });
  }

  @override
  void dispose() {
    _checkAuthStatusCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/images/splash_logo.svg")),
    );
  }
}
