import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:smart_wallet/core/constans/app_colors.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
                Text(
                  "Add Expense",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                Icon(CupertinoIcons.ellipsis, color: Colors.white),
              ],
            ),
            const SizedBox(height: 28),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabelText("NAME"),
                    const SizedBox(height: 8),
                    _buildTextField(
                      hintText: "Netflix",
                      cotroller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    _buildLabelText("AMOUNT"),
                    const SizedBox(height: 8),
                    _buildTextField(
                      hintText: "",
                      cotroller: _amountController,
                      isAmount: true,
                    ),
                    const SizedBox(height: 16),
                    _buildLabelText("DATE"),
                    const SizedBox(height: 8),
                    _buildTextField(
                      hintText: "",
                      cotroller: _dateController,
                      isDate: true,
                    ),
                    const SizedBox(height: 16),
                    _buildLabelText("INVOICE"),
                    const SizedBox(height: 8),
                    DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(8),
                        dashPattern: [5, 3],
                        color: Colors.grey.shade500,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          height: 40,
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(CupertinoIcons.plus_circle_fill),
                              const SizedBox(width: 8),
                              Text(
                                "Add Invoice",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(constraints: BoxConstraints(minHeight: 280)),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Add Expense"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildLabelText(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController cotroller,
    bool isAmount = false,
    bool isDate = false,
  }) {
    return TextField(
      style: TextStyle(color: Colors.deepPurple),
      keyboardType: isAmount
          ? TextInputType.number
          : isDate
          ? TextInputType.datetime
          : TextInputType.text,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),

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
