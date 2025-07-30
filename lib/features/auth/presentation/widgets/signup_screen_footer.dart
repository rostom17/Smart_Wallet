import 'package:flutter/material.dart';

import 'package:smart_wallet/core/constants/app_colors.dart';

class SignupScreenFooter extends StatelessWidget {
  const SignupScreenFooter({
    super.key,
    required this.hintText,
    required this.buttonName,
    required this.onTap,
  });

  final String hintText;
  final String buttonName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hintText, style: TextStyle(fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onTap,
            child: Text(
              buttonName,
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
