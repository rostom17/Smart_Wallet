import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key, required this.name, required this.email});

  final String name;
  final String email;

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
        _buildNameAndEmailRow(label: "Name", content: name),
        const SizedBox(height: 16),
        _buildNameAndEmailRow(label: "Email", content: email),
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
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey.shade700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
