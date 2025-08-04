import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddExpenseHeader extends StatelessWidget {
  const AddExpenseHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            context.pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),

        Icon(CupertinoIcons.ellipsis, color: Colors.white),
      ],
    );
  }
}
