import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/core/services/service_locator.main.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/check_auth_status_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/login_cubit.dart';
import 'package:smart_wallet/features/auth/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/common/bloc/transection_card_index_cubit.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/choose_day_month_year_cubit.dart';
import 'package:smart_wallet/features/statistics/presentation/bloc/drop_down_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/other_option_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> get blocProviders => [
    BlocProvider<CheckAuthStatusCubit>(
      create: (_) => serviceLocator<CheckAuthStatusCubit>(),
    ),

    BlocProvider<LoginCubit>(
      create: (_) => serviceLocator<LoginCubit>(),
      lazy: true,
    ),

    BlocProvider<BottomNavCubit>(
      create: (_) => serviceLocator<BottomNavCubit>(),
    ),

    BlocProvider<ShowPasswordCubit>(
      create: (_) => serviceLocator<ShowPasswordCubit>(),
      lazy: true,
    ),

    BlocProvider<TransectionCardIndexCubit>(
      create: (_) => serviceLocator<TransectionCardIndexCubit>(),
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
  ];
}
