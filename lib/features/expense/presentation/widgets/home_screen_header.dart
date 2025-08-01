
import 'package:flutter/material.dart';
import 'package:smart_wallet/features/common/widgets/notification_widget.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Afternoon",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Rostom Ali",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        NotificationWidget(),
      ],
    );
  }
}