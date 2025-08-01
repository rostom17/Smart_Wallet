import 'package:flutter/material.dart';
import 'package:smart_wallet/features/common/widgets/transection_card_widget.dart';

class TransectionHistory extends StatelessWidget {
  const TransectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
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
        ...List.generate(
          6,
          (index) =>
              TransectionCardWidget(itemIndex: index, fromHomeScreen: true),
        ),
      ],
    );
  }
}
