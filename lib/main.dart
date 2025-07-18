import 'package:flutter/material.dart';
import 'package:smart_wallet/config/app_routes.dart';

void main() {
  runApp(SmartWallet());
}

class SmartWallet extends StatelessWidget {
  const SmartWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: AppRoutes.router,);
  }
}
