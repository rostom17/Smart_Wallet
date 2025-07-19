import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/config/app_routes.dart';

import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/home/presentation/screens/home_screen.dart';
import 'package:smart_wallet/features/wallet/presentation/screens/wallet_screen.dart';

// ignore: must_be_immutable
class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Container(color: Colors.deepPurple),
    WalletScreen(),
    Container(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: _pages[state],
          ),

          floatingActionButton: _currentIndex == 0
              ? Transform.scale(
                  scale: 1.2,
                  child: FloatingActionButton(
                    onPressed: () {
                      context.pushNamed(AppRoutes.addExpenseScreen);
                    },
                    backgroundColor: ColorPallet.primaryColor,
                    foregroundColor: ColorPallet.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(32),
                    ),
                    child: Icon(Icons.add),
                  ),
                )
              : null,

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 16,
            elevation: 10,
            height: 80,
            child: Row(
              children: [
                _buildTabItem(
                  selectedIcon: "assets/icons/home_fill.png",
                  unselectedIcon: "assets/icons/home.png",
                  index: 0,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: "assets/icons/stats_fill.png",
                  unselectedIcon: "assets/icons/stats.png",
                  index: 1,
                  context: context,
                ),
                SizedBox(width: _currentIndex == 0 ? 60 : 0),
                _buildTabItem(
                  selectedIcon: "assets/icons/wallet_fill.png",
                  unselectedIcon: "assets/icons/wallet.png",
                  index: 2,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: "assets/icons/user_fill.png",
                  unselectedIcon: "assets/icons/user.png",
                  index: 3,
                  context: context,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabItem({
    required String selectedIcon,
    required String unselectedIcon,
    required int index,
    required BuildContext context,
  }) {
    final isSelected = index == _currentIndex;
    return Expanded(
      child: InkWell(
        radius: 0,
        onTap: () => _onTabSelected(index, context),
        child: isSelected
            ? ImageIcon(
                AssetImage(selectedIcon),
                color: ColorPallet.primaryColor,
              )
            : ImageIcon(AssetImage(unselectedIcon)),
      ),
    );
  }

  void _onTabSelected(int index, BuildContext context) {
    context.read<BottomNavCubit>().onTabChanged(index);
    _currentIndex = context.read<BottomNavCubit>().state;
  }
}
