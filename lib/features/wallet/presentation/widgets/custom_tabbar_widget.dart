import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/constans/app_colors.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/tab_index_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/widgets/accounts_tab.dart';
import 'package:smart_wallet/features/wallet/presentation/widgets/card_tab.dart';

class CutomTabBar extends StatefulWidget {
  const CutomTabBar({super.key});

  @override
  State<CutomTabBar> createState() => _CutomTabBarState();
}

class _CutomTabBarState extends State<CutomTabBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabIndexCubit, int>(
      builder: (context, tabIndex) {
        return Column(
          children: [
            _buildTabBar(tabIndex, context),
            const SizedBox(height: 40),
            _buildTabBarView(tabIndex),
          ],
        );
      },
    );
  }

  Padding _buildTabBar(int tabIndex, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: tabIndex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                width: (MediaQuery.of(context).size.width - 96) / 2,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: buildTab(title: "Cards", index: 0, tabIndex: tabIndex),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildTab(
                    title: "Accounts",
                    index: 1,
                    tabIndex: tabIndex,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildTabBarView(int tabIndex) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final offsetAnimation =
              Tween<Offset>(
                begin: tabIndex == 0
                    ? const Offset(1.0, 0.0)
                    : const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );
          return SlideTransition(position: offsetAnimation, child: child);
        },
        child: tabIndex == 0
            ? Container(key: const ValueKey(0), child: CardTab())
            : Container(key: const ValueKey(1), child: AccountsTab()),
      ),
    );
  }

  Widget buildTab({
    required String title,
    required int index,
    required tabIndex,
  }) {
    final isSelected = tabIndex == index;
    return GestureDetector(
      onTap: () {
        if (index == 0) {
          context.read<TabIndexCubit>().onTapCard();
        } else {
          context.read<TabIndexCubit>().onTapAccounts();
        }
      },
      child: Container(
        height: 44,
        width: (MediaQuery.of(context).size.width - 96) / 2,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.primaryColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}
