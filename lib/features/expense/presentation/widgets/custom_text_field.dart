
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.cotroller,
    this.isAmount = false,
    this.isDate = false,
    super.key,
  });

  final String hintText;
  final TextEditingController cotroller;
  final bool isAmount;
  final bool isDate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cotroller,
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
            ? IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month))
            : null,
      ),
    );
  }
}