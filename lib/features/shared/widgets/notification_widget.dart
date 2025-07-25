import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_wallet/config/color_pallet.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPallet.secondaryColor.withAlpha(155),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Badge(
          backgroundColor: Colors.orange,
          child: Icon(CupertinoIcons.bell, color: Colors.white),
        ),
      ),
    );
  }
}
