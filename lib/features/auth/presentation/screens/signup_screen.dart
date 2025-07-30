import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/signup_screen_footer.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/signup_screen_header.dart';
import 'package:smart_wallet/features/auth/presentation/widgets/social_login_row.dart';

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
                SignupScreenHeader(),
                const SizedBox(height: 32),
                _buildTextFormField(
                  hintText: "Username",
                  textEditingController: _userNameController,
                ),
                const SizedBox(height: 20),
                _buildTextFormField(
                  hintText: "Email",
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
                SocialLoginRow(),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SignupScreenFooter(),
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
