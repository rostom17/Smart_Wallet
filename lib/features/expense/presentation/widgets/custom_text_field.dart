import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/core/utls/date_formatter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.controller,
    this.isAmount = false,
    this.isDate = false,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isAmount;
  final bool isDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.deepPurple),
      keyboardType: isAmount
          ? TextInputType.number
          : isDate
          ? TextInputType.datetime
          : TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12),
        prefixIcon: isAmount
            ? Icon(
                CupertinoIcons.money_dollar,
                color: AppColors.primaryColor,
                size: 16,
              )
            : null,

        suffixIcon: isDate
            ? IconButton(
                onPressed: () async {
                  final results = await showCalendarDatePicker2Dialog(
                    context: context,
                    config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.single,
                      selectedDayHighlightColor: AppColors.primaryColor,
                      firstDate: DateTime(2025),
                      lastDate: DateTime(2050),
                    ),

                    borderRadius: BorderRadius.circular(16),
                    dialogSize: Size(
                      MediaQuery.of(context).size.width * .85,
                      400,
                    ),
                  );

                  if (results != null) {
                    controller.text = DateFormatter.yyyyMMdd(
                      results.last ?? DateTime.now(),
                    );
                  }
                },
                icon: const Icon(Icons.calendar_month),
              )
            : null,
      ),
    );
  }
}
