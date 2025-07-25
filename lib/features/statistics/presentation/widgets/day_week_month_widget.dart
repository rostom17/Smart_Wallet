import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/choose_day_month_year_cubit.dart';

class DayWeekMonthWidget extends StatelessWidget {
  const DayWeekMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChooseDayMonthYearCubit, int>(
      builder: (context, selectedIndex) {
        return Row(
          children: [
            _buildActionButton(
              context: context,
              name: "Day",
              index: 0,
              selectedIndex: selectedIndex,
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              context: context,
              name: "Week",
              index: 1,
              selectedIndex: selectedIndex,
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              context: context,
              name: "Month",
              index: 2,
              selectedIndex: selectedIndex,
            ),
            const SizedBox(width: 12),
            _buildActionButton(
              context: context,
              name: "Year",
              index: 3,
              selectedIndex: selectedIndex,
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String name,
    required int index,
    required int selectedIndex,
  }) {
    bool isSelected = index == selectedIndex;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        context.read<ChooseDayMonthYearCubit>().onChangedIndex(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: 40,
        width: MediaQuery.of(context).size.width * .19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? ColorPallet.secondaryColor : Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
