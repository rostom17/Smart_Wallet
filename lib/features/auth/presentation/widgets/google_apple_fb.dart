import 'package:flutter/material.dart';

class GoogleAppleFB extends StatelessWidget {
  const GoogleAppleFB({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
