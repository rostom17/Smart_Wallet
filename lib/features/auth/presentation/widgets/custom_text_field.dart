import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/utls/email_checker.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.isPassword = false,
    this.isEmail = false,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final bool isPassword;
  final bool isEmail;

  @override
  Widget build(BuildContext context) {
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
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$hintText required";
        } else if (isEmail && !EmailChecker.emailChecker.hasMatch(value)) {
          return "Enter valid email";
        } else {
          return null;
        }
      },
    );
  }
}
