import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/router/app_routes.dart';
import 'package:smart_wallet/core/themes/app_theme.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/shared/bloc/transection_card_index_cubit.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/choose_day_month_year_cubit.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/drop_down_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/other_option_cubit.dart';

void main() async {
  runApp(SmartWallet());
}

class SmartWallet extends StatelessWidget {
  const SmartWallet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
        BlocProvider<ShowPasswordCubit>(
          create: (_) => ShowPasswordCubit(),
          lazy: true,
        ),
        BlocProvider<TransectionCardIndexCubit>(
          create: (_) => TransectionCardIndexCubit(),
        ),
        BlocProvider<OtherOptionCubit>(
          create: (_) => OtherOptionCubit(),
          lazy: true,
        ),
        BlocProvider<ChooseDayMonthYearCubit>(
          create: (_) => ChooseDayMonthYearCubit(),
        ),
        BlocProvider<DropDownCubit>(create: (_) => DropDownCubit(), lazy: true),
        BlocProvider<ChangeProfileWidgetCubit>(
          create: (_) => ChangeProfileWidgetCubit(),
        ),
        BlocProvider<ShowPasswordCubit2>(
          create: (_) => ShowPasswordCubit2(),
          lazy: true,
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        theme: AppTheme.lightTheme(),
      ),
    );
  }
}
