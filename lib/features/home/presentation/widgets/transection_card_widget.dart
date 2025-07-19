import 'package:flutter/material.dart';

class TransectionCardWidget extends StatelessWidget {
  const TransectionCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),

            //color: ColorPallet.secondaryColor,
          ),

          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(179, 235, 242, 242),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/icons/apple-logo.png"),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Text(
                    "Upwork",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Yesterday",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "+\$ 860.00",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
