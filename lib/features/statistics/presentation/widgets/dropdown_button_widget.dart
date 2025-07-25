import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/drop_down_cubit.dart';

class DropdownButtonWidget extends StatelessWidget {
  const DropdownButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(flex: 5, child: SizedBox()),
        BlocBuilder<DropDownCubit, String>(
          builder: (context, state) {
            return Flexible(
              flex: 3,
              child: Transform.scale(
                scale: .9,
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(12),
                  decoration: InputDecoration(
                    isDense: true,
                    enabled: true,
                    fillColor: Colors.transparent,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: [
                    DropdownMenuItem(
                      value: context.read<DropDownCubit>().options[0],
                      child: Text(context.read<DropDownCubit>().options[0]),
                    ),
                    DropdownMenuItem(
                      value: context.read<DropDownCubit>().options[1],
                      child: Text(context.read<DropDownCubit>().options[1]),
                    ),
                  ],
                  value: state,
                  onChanged: (val) {
                    if (val != null) {
                      context.read<DropDownCubit>().onChangedValue(val);
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
