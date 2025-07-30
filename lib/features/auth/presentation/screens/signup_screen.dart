import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/divider_widget.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/signup_screen_footer.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/signup_screen_header.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/social_login_row.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _userNameController = TextEditingController();
  final _userEmailController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _userConfirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 92, left: 24, right: 24, bottom: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SignupScreenHeader(),
                  const SizedBox(height: 32),
                  CustomTextField(
                    hintText: "Username",
                    textEditingController: _userNameController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Email",
                    textEditingController: _userPasswordController,
                    isEmail: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Password",
                    textEditingController: _userConfirmPasswordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Confirm password",
                    textEditingController: _userEmailController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: _onPressedSignUpButton,
                    child: Text("Register"),
                  ),
                  const SizedBox(height: 20),

                  DividerWidget(title: "Or Register With"),
                  const SizedBox(height: 20),

                  SocialLoginRow(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SignupScreenFooter(
        hintText: "Already have an account?",
        buttonName: "Login Now",
        onTap: () {
          context.pushNamed(AppRoutes.loginScreen);
        },
      ),
    );
  }

  Future<void> _onPressedSignUpButton() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {}
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userEmailController.dispose();
    _userPasswordController.dispose();
    _userConfirmPasswordController.dispose();
    super.dispose();
  }
}
