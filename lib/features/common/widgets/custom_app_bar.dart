import 'package:flutter/material.dart';
import 'package:smart_wallet/features/common/widgets/notification_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appBarName,
    required this.onTapBackButton,
    required this.onTapNotificationButton,
  });

  final String appBarName;
  final VoidCallback onTapBackButton;
  final VoidCallback onTapNotificationButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTapBackButton,
            child: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          Text(
            appBarName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          NotificationWidget(),
        ],
      ),
    );
  }
}
