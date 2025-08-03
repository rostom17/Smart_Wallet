import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                TextButton(onPressed: () {}, child: Text("See all")),
              ],
            ),
            if (state is GetAllExpenseLoading)
              CircularProgressIndicator.adaptive(),
            if (state is GetAllExpenseSuccessfull)
              ...state.expenseList.map(
                (expense) => TransectionCardWidget(expense: expense),
              ),
            if (state is GetAllExpenseFailed) Text(state.error.errorMessage),
          ],
        );
      },
    );
  }
}
