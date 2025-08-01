import 'package:flutter/material.dart';
import '../widgets/custom_text_field.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/add_invoice_button.dart';
import 'package:smart_wallet/features/common/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/add_expense_header.dart';

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
            AddExpenseHeader(),
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
                child: _buildTextFields(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildTextFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabelText("NAME"),
        const SizedBox(height: 8),
        CustomTextField(hintText: "Netflix", cotroller: _nameController),
        const SizedBox(height: 16),
        _buildLabelText("AMOUNT"),
        const SizedBox(height: 8),
        CustomTextField(
          hintText: "",
          cotroller: _amountController,
          isAmount: true,
        ),
        const SizedBox(height: 16),
        _buildLabelText("DATE"),
        const SizedBox(height: 8),
        CustomTextField(hintText: "", cotroller: _dateController, isDate: true),
        const SizedBox(height: 16),
        _buildLabelText("INVOICE"),
        const SizedBox(height: 8),
        AddInvoiceButton(),
        ConstrainedBox(constraints: BoxConstraints(minHeight: 280)),

        ElevatedButton(onPressed: () {}, child: Text("Add Expense")),
      ],
    );
  }

  Text _buildLabelText(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
    );
  }
}
