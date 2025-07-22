import 'package:flutter/material.dart';
import 'package:smart_wallet/config/color_pallet.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  final TextEditingController _cardHolderNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset("assets/images/Cards.png"),
        ),
        const SizedBox(height: 20),
        Text(
          "Add your debit card",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          "This card must be connected to a back account under your name.",
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 12),
        _buildTextFormField(
          labelText: "NAME ON CARD",
          controller: _cardHolderNameController,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                labelText: "DEBIT CARD NUMBER",
                controller: _cardNumberController,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextFormField(
                labelText: "CVC",
                controller: _cvcController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildTextFormField(
                labelText: "EXPIRATION MM/YYYY",
                controller: _expiryDateController,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildTextFormField(
                labelText: "ZIP",
                controller: _zipController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: Text("Next")),
      ],
    );
  }

  TextFormField _buildTextFormField({
    required String labelText,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ColorPallet.primaryColor, width: 1.5),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty == true) {
          return "Field Can't be empty";
        } else {
          return null;
        }
      },
    );
  }
}
