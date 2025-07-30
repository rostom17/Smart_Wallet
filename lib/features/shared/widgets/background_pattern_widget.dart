import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';

class BackgroundPatternWidget extends StatelessWidget {
  const BackgroundPatternWidget({super.key, required this.yourWidgetTree});

  final Widget yourWidgetTree;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: screenHeight * .32,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 60),
                  bottomRight: Radius.elliptical(200, 60),
                ),
              ),
            ),
            SvgPicture.asset("assets/images/pattern.svg"),
            yourWidgetTree,
          ],
        ),
      ),
    );
  }
}
