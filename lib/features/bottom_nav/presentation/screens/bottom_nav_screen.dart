import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/home/presentation/screens/home_screen.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});
  final List<Widget> screens = [
    HomeScreen(),
    Container(color: Colors.amber),
    Container(color: Colors.redAccent),
    Container(color: Colors.deepPurple),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        int currentIndex = state;

        return Scaffold(
          body: screens[currentIndex],
          floatingActionButton: FloatingActionButton(
            
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: [
              Icons.home,
              Icons.percent,
              Icons.dashboard,
              Icons.open_in_browser,
            ],
            gapLocation: GapLocation.center,
            activeIndex: currentIndex,
            onTap: (index) =>
                context.read<BottomNavCubit>().onTabChanged(index),
          ),
          
        );
      },
    );
  }
}
