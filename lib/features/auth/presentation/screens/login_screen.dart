import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/login_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/divider_widget.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/signup_screen_footer.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/social_login_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _onLogin() async {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
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
                  SvgPicture.asset("assets/images/splash_logo.svg"),
                  const SizedBox(height: 32),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Welcome back.!",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 32),

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

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?"),
                    ),
                  ),

                  BlocConsumer<LoginCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccessful) {
                        context.pushReplacementNamed(AppRoutes.bottomNavScreen);
                      } else if (state is AuthFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.failure.errorMessage)),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          if (state is! AuthLoading) {
                            _onLogin();
                          }
                        },
                        child: state is AuthLoading
                            ? CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : Text("Login"),
                      );
                    },
                  ),
                  const SizedBox(height: 20),

                  DividerWidget(title: "Or Login With"),
                  const SizedBox(height: 20),

                  SocialLoginRow(),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SignupScreenFooter(
        hintText: "Don't have an account?",
        buttonName: "Register Now",
        onTap: () {
          context.pushNamed(AppRoutes.signupScreen);
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
