import 'package:flutter/material.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/social_login_button.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialLoginButton(
          imagePath: "assets/icons/facebook.png",
          onTap: facebookLogin,
        ),
        SocialLoginButton(
          imagePath: "assets/icons/google.png",
          onTap: gooleLogin,
        ),
        SocialLoginButton(
          imagePath: "assets/icons/apple-logo.png",
          onTap: appleLogin,
        ),
      ],
    );
  }

  void facebookLogin() {}
  void gooleLogin() {}
  void appleLogin() {}
}
