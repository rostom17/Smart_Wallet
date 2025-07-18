import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/config/app_routes.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/google_apple_fb.dart';

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
                  child: Column(
                    children: [
                      Text(
                        "Nice to meet you",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Before we begin, we need some details.",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildTextFormField(
                  hintText: "Username",
                  textEditingController: _userNameController,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  hintText: "Enter your email",
                  textEditingController: _userPasswordController,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  hintText: "Password",
                  textEditingController: _userConfirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  hintText: "Confirm password",
                  textEditingController: _userEmailController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                ElevatedButton(onPressed: () {}, child: Text("Register")),
                const SizedBox(height: 28),
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
                  color: ColorPallet.secondaryColor,
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
