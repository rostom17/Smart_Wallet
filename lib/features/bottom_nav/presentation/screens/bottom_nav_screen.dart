import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/config/app_routes.dart';

import 'package:smart_wallet/config/color_pallet.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/home/presentation/screens/home_screen.dart';
import 'package:smart_wallet/features/profile/presentation/screens/profile_screen.dart';
import 'package:smart_wallet/features/statistics/presentation/screens/statistics_screen.dart';
import 'package:smart_wallet/features/wallet/presentation/screens/wallet_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final List<Widget> _pages = [
    HomeScreen(),
    StatisticsScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, bottomNavIndex) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: _pages[bottomNavIndex],
          ),

          floatingActionButton: bottomNavIndex == 0
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
            height: 50,
            child: Row(
              children: [
                _buildTabItem(
                  selectedIcon: "assets/icons/home_fill.png",
                  unselectedIcon: "assets/icons/home.png",
                  index: 0,
                  bottomNavIndex: bottomNavIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: "assets/icons/stats_fill.png",
                  unselectedIcon: "assets/icons/stats.png",
                  index: 1,
                  bottomNavIndex: bottomNavIndex,
                  context: context,
                ),
                SizedBox(width: bottomNavIndex == 0 ? 60 : 0),
                _buildTabItem(
                  selectedIcon: "assets/icons/wallet_fill.png",
                  unselectedIcon: "assets/icons/wallet.png",
                  index: 2,
                  bottomNavIndex: bottomNavIndex,
                  context: context,
                ),
                _buildTabItem(
                  selectedIcon: "assets/icons/user_fill.png",
                  unselectedIcon: "assets/icons/user.png",
                  index: 3,
                  bottomNavIndex: bottomNavIndex,
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
    required int bottomNavIndex,
    required BuildContext context,
  }) {
    final isSelected = index == bottomNavIndex;
    return Expanded(
      child: InkWell(
        radius: 0,
        onTap: () => _onTabSelected(index, context, bottomNavIndex),
        child: isSelected
            ? ImageIcon(
                AssetImage(selectedIcon),
                color: ColorPallet.primaryColor,
              )
            : ImageIcon(AssetImage(unselectedIcon)),
      ),
    );
  }

  void _onTabSelected(int index, BuildContext context, int _currentIndex) {
    context.read<BottomNavCubit>().onTabChanged(index);
    _currentIndex = context.read<BottomNavCubit>().state;
  }
}
