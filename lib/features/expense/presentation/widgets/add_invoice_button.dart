import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddInvoiceButton extends StatelessWidget {
  const AddInvoiceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
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
    );
  }
}
