import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/get_all_expense_cubit.dart';

import 'package:smart_wallet/features/expense/presentation/widgets/balance_card_widget.dart';
import 'package:smart_wallet/features/common/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/home_screen_header.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/transection_history.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetAllExpenseCubit>().getAllExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
        child: Column(
          children: [
            HomeScreenHeader(),
            const SizedBox(height: 28),
            BalanceCardWidget(screenHeight: screenHeight),
            const SizedBox(height: 12),
            TransectionHistory(),
          ],
        ),
      ),
    );
  }
}
