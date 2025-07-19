import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/home/presentation/widgets/balance_card_widget.dart';
import 'package:smart_wallet/features/home/presentation/widgets/transection_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                color: ColorPallet.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 60),
                  bottomRight: Radius.elliptical(200, 60),
                ),
              ),
            ),
            SvgPicture.asset("assets/images/pattern.svg"),
            Padding(
              padding: EdgeInsets.only(top: 80, right: 24, left: 24),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
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
                      Container(
                        decoration: BoxDecoration(
                          color: ColorPallet.secondaryColor.withAlpha(155),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Badge(
                            backgroundColor: Colors.orange,
                            child: Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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
                  ...List.generate(5, (index) => TransectionCardWidget()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
