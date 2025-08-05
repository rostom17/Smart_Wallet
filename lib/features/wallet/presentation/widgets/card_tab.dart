import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/core/utls/app_snackbar.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/add_new_card_cubit.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  final _cardHolderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _cvcController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _zipController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _onAddCard() async {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AddNewCardCubit>().addNewCard(
        holderName: _cardHolderNameController.text.trim(),
        cardNo: _cardNumberController.text.trim(),
        cvc: _cvcController.text,
        expiryDate: _expiryDateController.text,
      );
    }
  }

  @override
  void initState() {
    _zipController.text = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                  isZip: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          BlocConsumer<AddNewCardCubit, AddNewCardState>(
            listener: (context, state) {
              if (state is AddNewCardFailed) {
                AppSnackbar.showSnackBar(
                  context: context,
                  content: state.error.errorMessage,
                );
              }
              if (state is AddNewCardSuccess) {
                AppSnackbar.showSnackBar(
                  context: context,
                  content: "New Card Added",
                );
                context.pop();
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state is! AddNewCardLoading ? _onAddCard : null,
                child: state is! AddNewCardLoading
                    ? Text("Add Card")
                    : CircularProgressIndicator.adaptive(),
              );
            },
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextFormField({
    required String labelText,
    required TextEditingController controller,
    bool isZip = false,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        enabled: !isZip,
        labelStyle: TextStyle(fontSize: 11, color: Colors.grey.shade700),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
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

  @override
  void dispose() {
    _cardHolderNameController.dispose();
    _cardNumberController.dispose();
    _cvcController.dispose();
    _expiryDateController.dispose();
    _zipController.dispose();
    super.dispose();
  }
}
