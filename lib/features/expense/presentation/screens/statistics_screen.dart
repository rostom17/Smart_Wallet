import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_wallet/core/utls/month_names.dart';
import 'package:smart_wallet/core/utls/transection_history.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/transection_card_widget.dart';
import 'package:smart_wallet/features/expense/domain/entities/expense_entity.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/time_period_selector.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/dropdown_button_widget.dart';

import 'package:smart_wallet/features/expense/presentation/widgets/statistics_appbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            StatisticsAppbar(),
            const SizedBox(height: 28),
            TimePeriodSelector(),
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
                children: MonthNames.monthNames
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
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.swap_vert, color: Colors.grey.shade700),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...List.generate(
              TransectionHistory.transections.length,
              (index) => TransectionCardWidget(
                expense: ExpenseEntity(
                  id: -1,
                  title: "Dummy",
                  amount: 30.4,
                  date: DateTime.now(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
