import 'package:flutter/material.dart';

class StatisticsAppbar extends StatelessWidget {
  const StatisticsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
        ),
        Text(
          "Statistics",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: () {},
          child: ImageIcon(AssetImage("assets/icons/download.png")),
        ),
      ],
    );
  }
}
