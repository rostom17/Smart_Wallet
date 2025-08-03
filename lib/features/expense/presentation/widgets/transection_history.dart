import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/core/utls/transection_history.dart';
import 'package:smart_wallet/features/expense/presentation/widgets/transection_card_widget.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/get_all_expense_cubit.dart';

class TransectionHistory extends StatelessWidget {
  const TransectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllExpenseCubit, GetAllExpenseState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transection History",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                TextButton(
                  onPressed: () {
                    context.read<BottomNavCubit>().onTabChanged(1);
                  },
                  child: Text("See all"),
                ),
              ],
            ),
            if (state is GetAllExpenseLoading)
              CircularProgressIndicator.adaptive(),
            if (state is GetAllExpenseSuccessfull)
              ...state.expenseList
                  .sublist(0, getSublistLength(state.expenseList.length))
                  .map(
                    (expense) => TransectionCardWidget(
                      expense: expense,
                      iconIndex: TransectionHistoryUtl.iconIndex,
                      fromHomeScreen: true,
                    ),
                  ),
            if (state is GetAllExpenseFailed) Text(state.error.errorMessage),
          ],
        );
      },
    );
  }

  int getSublistLength(int maxLen) {
    return maxLen > 10 ? 10 : maxLen;
  }
}
