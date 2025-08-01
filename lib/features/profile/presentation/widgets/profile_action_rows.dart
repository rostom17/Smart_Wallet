import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';

class ProfileActionRows extends StatelessWidget {
  const ProfileActionRows({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color.fromARGB(255, 226, 233, 240),
              ),
              child: Image.asset("assets/icons/diamond.png"),
            ),
            const SizedBox(width: 20),
            Text(
              "Invite Friends",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
        ),
        Column(
          children: [
            _buildActonRow(
              actionName: "Account info",
              widget: ImageIcon(
                AssetImage("assets/icons/user_fill.png"),
                color: Colors.grey.shade700,
              ),
              onTap: () {
                context.read<ChangeProfileWidgetCubit>().onPressedAccountInfo();
              },
            ),
            const SizedBox(height: 4),
            _buildActonRow(
              actionName: "Login and security",
              widget: ImageIcon(
                AssetImage("assets/icons/shield.png"),
                color: Colors.grey.shade700,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 4),
            _buildActonRow(
              actionName: "Data and privacy",
              widget: ImageIcon(
                AssetImage("assets/icons/lock.png"),
                color: Colors.grey.shade700,
              ),
              onTap: () {},
            ),
            const SizedBox(height: 4),
            _buildActonRow(
              actionName: "Logout",
              widget: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActonRow({
    required String actionName,
    required Widget widget,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: Padding(padding: const EdgeInsets.all(10.0), child: widget),
          ),
          const SizedBox(width: 20),
          Text(
            actionName,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
