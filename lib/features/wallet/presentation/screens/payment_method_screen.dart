import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/features/common/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/common/widgets/notification_widget.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/account_selector_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/tab_index_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/widgets/custom_tabbar_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabIndexCubit>(
          create: (context) => TabIndexCubit(selectedIndex: selectedIndex),
        ),
        BlocProvider<AccountSelectorCubit>(
          create: (context) => AccountSelectorCubit(),
        ),
      ],
      child: BackgroundPatternWidget(
        yourWidgetTree: Column(
          children: [
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushReplacementNamed(AppRoutes.bottomNavScreen);
                    },
                    child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  ),
                  Text(
                    "Connect Wallet",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  NotificationWidget(),
                ],
              ),
            ),
            const SizedBox(height: 48),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 800),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 28, left: 24, right: 23),
                  child: CutomTabBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
