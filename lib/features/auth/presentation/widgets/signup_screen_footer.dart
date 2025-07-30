import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/core/router/app_routes.dart';

class SignupScreenFooter extends StatelessWidget {
  const SignupScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(AppRoutes.loginScreen);
            },
            child: Text(
              "Login Now",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
