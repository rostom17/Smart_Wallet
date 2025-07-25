import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import '../bloc/show_password_cubit.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelName,
    required this.textEditingController,
    this.isPassword = false,
  });

  final String labelName;
  final TextEditingController textEditingController;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPasswordCubit2, bool>(
      builder: (context, show) {
        return TextFormField(
          controller: textEditingController,
          obscureText: isPassword && !show,
          decoration: InputDecoration(
            isDense: true,
            enabled: true,
            fillColor: Colors.transparent,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPallet.primaryColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorPallet.primaryColor,
                width: 1.5,
              ),
            ),
            label: Text(labelName),
            suffixIcon: isPassword
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<ShowPasswordCubit2>()
                            .togglePasswordVisibility();
                      },
                      child: ImageIcon(
                        AssetImage(
                          !show
                              ? "assets/icons/show_pass.png"
                              : "assets/icons/hide_pass.png",
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ),
        );
      },
    );
  }
}
