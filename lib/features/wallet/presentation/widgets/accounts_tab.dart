import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/account_option_cubit.dart';

class AccountsTab extends StatelessWidget {
  const AccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountOptionCubit, int?>(
      builder: (context, selectedIndex) {
        return Column(
          children: [
            _buildOptionCard(
              context: context,
              name: "Bank Link",
              description: "Connect your bank to deposit & fund",
              iconPath: "assets/icons/bank2.png",
              index: 0,
              selectedIndex: selectedIndex,
            ),
            const SizedBox(height: 20),
            _buildOptionCard(
              context: context,
              name: "Paypal",
              description: "Connect to your paypal account",
              iconPath: "assets/icons/paypal.png",
              index: 1,
              selectedIndex: selectedIndex,
            ),
          ],
        );
      },
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required String name,
    required String description,
    required String iconPath,
    required int index,
    required int? selectedIndex,
  }) {
    bool isSelected = index == selectedIndex;
    return InkWell(
      onTap: () {
        if (index == 0) {
          context.read<AccountOptionCubit>().onSelectBankLink();
        } else if (index == 1) {
          context.read<AccountOptionCubit>().onSelectPaypal();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
        height: 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.deepPurple.withAlpha(40)
              : const Color.fromARGB(255, 247, 245, 245),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: ImageIcon(
                    AssetImage(iconPath),
                    color: isSelected ? ColorPallet.primaryColor : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? ColorPallet.primaryColor
                            : Colors.grey.shade700,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? ColorPallet.secondaryColor
                            : Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Checkbox(
                shape: CircleBorder(),
                value: isSelected,
                onChanged: (val) {
                  if (index == 0) {
                    context.read<AccountOptionCubit>().onSelectBankLink();
                  } else if (index == 1) {
                    context.read<AccountOptionCubit>().onSelectPaypal();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
