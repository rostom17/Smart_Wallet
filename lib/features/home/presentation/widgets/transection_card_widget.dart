import 'package:flutter/material.dart';
import 'package:smart_wallet/config/color_pallet.dart';

class TransectionCardWidget extends StatelessWidget {
  const TransectionCardWidget({
    super.key,
    required this.itemIndex,
    required this.selectedIndex,
    this.fromHomeScreen = false,
  });

  final int itemIndex;
  final int selectedIndex;
  final bool fromHomeScreen;

  @override
  Widget build(BuildContext context) {
    bool isSelected = itemIndex == selectedIndex;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: isSelected && !fromHomeScreen
                ? ColorPallet.secondaryColor
                : null,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              isSelected && !fromHomeScreen
                  ? BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 8,
                      offset: Offset(8, 8),
                    )
                  : BoxShadow(color: Colors.transparent),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: fromHomeScreen
                        ? const Color.fromARGB(179, 235, 242, 242)
                        : null,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset("assets/icons/apple-logo.png"),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      "Upwork",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected && !fromHomeScreen
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      "Yesterday",
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected && !fromHomeScreen
                            ? Colors.white
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "+\$ 860.00",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: isSelected && !fromHomeScreen
                        ? Colors.white
                        : Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
