import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_wallet/features/shared/widgets/transection_card_widget.dart';
import 'package:smart_wallet/features/statistics/presentation/widgets/day_week_month_widget.dart';
import 'package:smart_wallet/features/statistics/presentation/widgets/dropdown_button_widget.dart';

import 'package:smart_wallet/features/statistics/presentation/widgets/statistics_appbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StatisticsAppbar(),
            const SizedBox(height: 28),
            DayWeekMonthWidget(),
            const SizedBox(height: 20),
            DropdownButtonWidget(),
            const SizedBox(height: 20),
            Stack(
              children: [
                SvgPicture.asset("assets/images/chart.svg"),
                SvgPicture.asset("assets/images/line.svg"),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: monthNames
                    .map(
                      (month) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Text(month),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Spendig",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                GestureDetector(onTap: () {}, child: Icon(Icons.swap_vert)),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              monthNames.length,
              (index) => TransectionCardWidget(itemIndex: index),
            ),
          ],
        ),
      ),
    );
  }
}
