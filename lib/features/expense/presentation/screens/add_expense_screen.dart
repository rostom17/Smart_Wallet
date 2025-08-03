import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/utls/app_snackbar.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/add_expense_cubit.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/get_all_expense_cubit.dart';
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
  final _formKey = GlobalKey<FormState>();

  Future<void> _addExpense() async {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AddExpenseCubit>().addExpense(
        title: _nameController.text.trim(),
        amount: double.tryParse(_amountController.text) ?? 0.0,
        dateTime: _dateController.text.trim(),
      );
    }
  }

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
                  bottom: 12,
                  left: 16,
                  right: 16,
                ),
                child: _buildInputFields(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabelText("NAME"),
          const SizedBox(height: 8),
          CustomTextField(hintText: "Netflix", controller: _nameController),
          const SizedBox(height: 16),
          _buildLabelText("AMOUNT"),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: "",
            controller: _amountController,
            isAmount: true,
          ),
          const SizedBox(height: 16),
          _buildLabelText("DATE"),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: "",
            controller: _dateController,
            isDate: true,
          ),
          const SizedBox(height: 16),
          _buildLabelText("INVOICE"),
          const SizedBox(height: 8),
          AddInvoiceButton(),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * .32,
            ),
          ),

          BlocConsumer<AddExpenseCubit, AddExpenseState>(
            listener: (context, state) {
              if (state is AddExpenseFailed) {
                AppSnackbar.showSnackBar(
                  context: context,
                  content: "Failed to add new expense",
                );
              }
              if (state is AddExpnseSuccessful) {
                context.read<GetAllExpenseCubit>().getAllExpense();
                AppSnackbar.showSnackBar(
                  context: context,
                  content: "New expense added",
                );
                context.pop();
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: _addExpense,
                child: state is! AddExpenseLoading
                    ? Text("Add Expense")
                    : CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.white,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

  Text _buildLabelText(String name) {
    return Text(
      name,
      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
