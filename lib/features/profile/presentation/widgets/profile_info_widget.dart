import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import '../bloc/show_password_cubit.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FloatingActionButton(
              backgroundColor: AppColors.secondaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              onPressed: () {
                context.read<ChangeProfileWidgetCubit>().onPressedEditProfile();
              },
              child: Icon(Icons.edit),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(label: "Name", content: "Rostom Ali"),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(label: "Email", content: "rostom1234@gmail.com"),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(
          label: "Password",
          content: "123456789",
          isPassword: true,
        ),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(label: "No of cards", content: "1"),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(label: "No of Bank Accounts", content: "2"),
      ],
    );
  }

  Widget _buildNameAndEmailRow({
    required String label,
    required String content,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
        BlocBuilder<ShowPasswordCubit2, bool>(
          builder: (context, isShow) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isPassword && !isShow
                      ? "*********************".substring(0, content.length)
                      : content,

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                isPassword
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<ShowPasswordCubit2>()
                              .togglePasswordVisibility();
                        },
                        child: ImageIcon(
                          AssetImage(
                            !isShow
                                ? "assets/icons/show_pass.png"
                                : "assets/icons/hide_pass.png",
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            );
          },
        ),
      ],
    );
  }
}
