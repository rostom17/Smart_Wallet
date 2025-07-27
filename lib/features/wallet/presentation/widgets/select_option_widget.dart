import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/constans/app_colors.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/other_option_cubit.dart';

class SelectPaymentOptionWidget extends StatefulWidget {
  const SelectPaymentOptionWidget({super.key});

  @override
  State<SelectPaymentOptionWidget> createState() =>
      _SelectPaymentOptionWidgetState();
}

class _SelectPaymentOptionWidgetState extends State<SelectPaymentOptionWidget> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100, left: 24, right: 24),
      child: Container(
        height: 350,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<OtherOptionCubit, bool>(
            builder: (context, state) {
              return Column(
                spacing: 10,
                children: [
                  Text(
                    "Select an option",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  _buildPaymentMethodOption(
                    name: "Cards",
                    imagePath: "assets/icons/credit.png",
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.cardAndBankAccountScreen,
                        extra: 0,
                      );
                    },
                  ),
                  _buildPaymentMethodOption(
                    name: "Bank Account",
                    imagePath: "assets/icons/bank.png",
                    onTap: () {
                      context.pushNamed(
                        AppRoutes.cardAndBankAccountScreen,
                        extra: 1,
                      );
                    },
                  ),
                  _buildPaymentMethodOption(
                    name: "Others",
                    imagePath: "assets/icons/cash.png",
                    onTap: () {
                      context.read<OtherOptionCubit>().shoeOtherAmountInput();
                    },
                  ),
                  const SizedBox(height: 10),
                  state == true ? _buildOtherWhenChoosen(context) : SizedBox(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodOption({
    required String name,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 30, child: Image.asset(imagePath)),
        ],
      ),
    );
  }

  Column _buildOtherWhenChoosen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amount"),
        TextField(
          controller: _amountController,

          decoration: InputDecoration(
            isDense: true,
            enabled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
            suffix: InkWell(
              onTap: () {
                _amountController.clear();
              },
              child: Text(
                "Clear",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildFilledButton(
              buttonName: "Cancel",
              isCancel: true,
              onPressed: () {
                context.read<OtherOptionCubit>().hideOtherAmountInput();
                _amountController.clear();
              },
            ),
            _buildFilledButton(
              buttonName: "Confirm",
              isCancel: false,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  OutlinedButton _buildFilledButton({
    required String buttonName,
    required bool isCancel,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: isCancel ? Colors.white : AppColors.secondaryColor,
        foregroundColor: isCancel ? AppColors.primaryColor : Colors.white,
      ),
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
