import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/core/utls/transection_history.dart';
import 'package:smart_wallet/features/common/bloc/transection_card_index_cubit.dart';

class TransectionCardWidget extends StatelessWidget {
  const TransectionCardWidget({
    super.key,
    required this.itemIndex,
    this.fromHomeScreen = false,
  });

  final int itemIndex;
  final bool fromHomeScreen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransectionCardIndexCubit, int>(
      builder: (context, state) {
        bool isSelected = state == itemIndex;
        return GestureDetector(
          onTap: () {
            context.read<TransectionCardIndexCubit>().changeIndex(itemIndex);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: isSelected && !fromHomeScreen
                    ? AppColors.secondaryColor
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
                    _buildIconContainer(),
                    const SizedBox(width: 8),
                    _buildNameAndDateTimeColumn(isSelected),
                    Spacer(),
                    _buildPlusMinusIcon(isSelected),
                    _buildAmount(isSelected),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildIconContainer() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: fromHomeScreen ? const Color.fromARGB(179, 235, 242, 242) : null,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          TransectionHistory.transections[itemIndex]["iconPath"],
        ),
      ),
    );
  }

  Column _buildNameAndDateTimeColumn(bool isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TransectionHistory.transections[itemIndex]["name"],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected && !fromHomeScreen ? Colors.white : Colors.black,
          ),
        ),
        Text(
          TransectionHistory.transections[itemIndex]["dateTime"],
          style: TextStyle(
            fontSize: 12,
            color: isSelected && !fromHomeScreen
                ? Colors.white
                : Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Text _buildPlusMinusIcon(bool isSelected) {
    return Text(
      TransectionHistory.transections[itemIndex]["isSpending"] ? "-" : "+",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: isSelected && !fromHomeScreen
            ? Colors.white
            : TransectionHistory.transections[itemIndex]["isSpending"]
            ? Colors.red
            : Colors.green,
      ),
    );
  }

  Text _buildAmount(bool isSelected) {
    return Text(
      "\$${TransectionHistory.transections[itemIndex]["amount"]}",
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: isSelected && !fromHomeScreen
            ? Colors.white
            : TransectionHistory.transections[itemIndex]["isSpending"]
            ? Colors.red
            : Colors.green,
      ),
    );
  }
}
