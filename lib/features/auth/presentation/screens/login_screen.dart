import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/google_apple_fb.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 92, left: 24, right: 24, bottom: 20),
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/images/splash_logo.svg"),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Welcome back! Glad to see you again.!",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 32),
                _buildTextFormField(
                  hintText: "Enter your email",
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  hintText: "Enter your password",
                  textEditingController: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?"),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(onPressed: () {}, child: Text("Login")),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or Register with",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    GoogleAppleFB(imagePath: "assets/icons/facebook.png"),
                    GoogleAppleFB(imagePath: "assets/icons/google.png"),
                    GoogleAppleFB(imagePath: "assets/icons/apple-logo.png"),
                  ],
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't have an account?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.signupScreen);
              },
              child: Text(
                "Register Now",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String hintText,
    required TextEditingController textEditingController,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,

        suffixIcon: isPassword
            ? BlocBuilder<ShowPasswordCubit, bool>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<ShowPasswordCubit>().togglePassword();
                    },
                    icon: Icon(
                      state ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    ),
                  );
                },
              )
            : null,
      ),
    );
  }
}
