import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/shared/widgets/notification_widget.dart';

class CardsAndBankAccountScreen extends StatelessWidget {
  const CardsAndBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                Text(
                  "Connect Wallet",
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
            constraints: BoxConstraints(maxHeight: 800),
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 28, left: 24, right: 23),
                child: CutomTabBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CutomTabBar extends StatefulWidget {
  const CutomTabBar({super.key});

  @override
  State<CutomTabBar> createState() => _CutomTabBarState();
}

class _CutomTabBarState extends State<CutomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(4),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: selectedIndex == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 96) / 2,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: buildTab("Cards", 0)),
                    const SizedBox(width: 12),
                    Expanded(child: buildTab("Accounts", 1)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              final offsetAnimation =
                  Tween<Offset>(
                    begin: selectedIndex == 0
                        ? const Offset(1.0, 0.0)
                        : const Offset(-1.0, 0.0),
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut),
                  );

              return SlideTransition(position: offsetAnimation, child: child);
            },
            child: selectedIndex == 0
                ? Container(key: const ValueKey(0), child: buildCardTab())
                : Container(key: const ValueKey(1), child: buildAccountTab()),
          ),
        ),
      ],
    );
  }

  Widget buildTab(String title, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Container(
        height: 44,
        width: (MediaQuery.of(context).size.width - 96) / 2,
        alignment: Alignment.center,
        // decoration: BoxDecoration(
        //   color: isSelected ? Colors.white : Colors.transparent,
        //   borderRadius: BorderRadius.circular(30),
        // ),
        child: Text(
          title,
          // style: TextStyle(
          //   fontWeight: FontWeight.w600,
          //   color: isSelected ? ColorPallet.primaryColor : Colors.grey,
          // ),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isSelected ? ColorPallet.primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildCardTab() {
    return Center(child: Text("Account Tab"));
  }

  Widget buildAccountTab() {
    return Center(child: Text("Bank Account Tabv"));
  }
}
