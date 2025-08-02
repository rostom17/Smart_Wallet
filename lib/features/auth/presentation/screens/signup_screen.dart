import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/utls/app_snackbar.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/signup_cubit.dart';
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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _onPressedSignUpButton() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text != _confirmPasswordController.text) {
        AppSnackbar.showSnackBar(
          context: context,
          content: "Password don't match",
        );
        return;
      }
      context.read<SignupCubit>().signup(
        userName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _confirmPasswordController.text,
      );
    }
  }

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
                    textEditingController: _nameController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Email",
                    textEditingController: _emailController,
                    isEmail: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Password",
                    textEditingController: _passwordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Confirm password",
                    textEditingController: _confirmPasswordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),

                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is SignupSuccessful) {
                        context.pushReplacementNamed(AppRoutes.bottomNavScreen);
                      }
                      if (state is SignupFailed) {
                        AppSnackbar.showSnackBar(
                          context: context,
                          content: state.failure.errorMessage,
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state is! SignupLoading) {
                            _onPressedSignUpButton();
                          }
                        },
                        child: state is SignupLoading
                            ? CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : Text("Register"),
                      );
                    },
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

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
