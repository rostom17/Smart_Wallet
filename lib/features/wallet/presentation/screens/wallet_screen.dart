import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/core/constans/app_colors.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/shared/widgets/custom_app_bar.dart';
import 'package:smart_wallet/features/wallet/presentation/widgets/select_option_widget.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            CustomAppBar(
              appBarName: "Wallet",
              onTapBackButton: () {
                context.read<BottomNavCubit>().onTabChanged(0);
              },
              onTapNotificationButton: () {},
            ),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 128,
              ),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "\$ 00.00",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 42),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _builActionButton(
                          icon: Icons.add_circle,
                          label: "Add",
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => SelectPaymentOptionWidget(),
                            );
                          },
                        ),
                        const SizedBox(width: 20),
                        _builActionButton(
                          icon: Icons.payments,
                          label: "Pay",
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                        _builActionButton(
                          icon: CupertinoIcons.location_fill,
                          label: "Send",
                          onTap: () {},
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _builActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.secondaryColor, width: 1.5),
            ),
            child: Icon(icon, color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
