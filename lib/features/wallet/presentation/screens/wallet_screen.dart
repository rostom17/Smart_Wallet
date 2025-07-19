import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/shared/widgets/notification_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  NotificationWidget(),
                ],
              ),
            ),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 600),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "\$ 00.00",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _builActionButton(
                          icon: Icons.add_circle,
                          label: "Add",
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        _builActionButton(
                          icon: Icons.payments,
                          label: "Pay",
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        _builActionButton(
                          icon: CupertinoIcons.location_fill,
                          label: "Send",
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorPallet.secondaryColor, width: 1.5),
            ),
            child: Icon(icon, color: ColorPallet.primaryColor),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
