import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/services/auth_service.dart';
import 'package:smart_wallet/core/services/service_locator.main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = serviceLocator<AuthService>();

  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  void _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    final isLoggedIn = await _authService.isLoggedIn;

    if (!mounted) return;
    if (isLoggedIn) {
      context.pushNamed(AppRoutes.bottomNavScreen);
    } else {
      context.pushNamed(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset("assets/images/splash_logo.svg")),
    );
  }
}
