import 'package:flutter/material.dart';

import 'package:smart_wallet/features/home/presentation/widgets/balance_card_widget.dart';
import 'package:smart_wallet/features/shared/widgets/transection_card_widget.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/shared/widgets/notification_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
        child: Column(
          children: [
            Row(
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
            ),
            const SizedBox(height: 28),
            BalanceCardWidget(screenHeight: screenHeight),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transection History",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(onPressed: () {}, child: Text("See all")),
              ],
            ),
            ...List.generate(
              6,
              (index) =>
                  TransectionCardWidget(itemIndex: index, fromHomeScreen: true),
            ),
          ],
        ),
      ),
    );
  }
}
