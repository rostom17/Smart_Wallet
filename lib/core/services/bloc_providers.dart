import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/core/services/service_locator.main.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/get_all_expense_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/show_password_cubit.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/time_period_selector_cubit.dart';
import 'package:smart_wallet/features/expense/presentation/bloc/drop_down_cubit.dart';
import 'package:smart_wallet/features/wallet/presentation/bloc/select_other_cubit.dart';

class AppBlocProviders {
  static List<BlocProvider> get blocProviders => [
    BlocProvider<CheckAuthStatusCubit>(
      create: (_) => serviceLocator<CheckAuthStatusCubit>(),
    ),

    BlocProvider<LoginCubit>(
      create: (_) => serviceLocator<LoginCubit>(),
      lazy: true,
    ),

    BlocProvider<SignupCubit>(create: (_) => serviceLocator<SignupCubit>()),

    BlocProvider<LogoutCubit>(
      create: (_) => serviceLocator<LogoutCubit>(),
      lazy: true,
    ),

    BlocProvider<BottomNavCubit>(
      create: (_) => serviceLocator<BottomNavCubit>(),
    ),

    BlocProvider<ShowPasswordCubit>(
      create: (_) => serviceLocator<ShowPasswordCubit>(),
      lazy: true,
    ),

    BlocProvider<ChooseTransectionCubit>(
      create: (_) => serviceLocator<ChooseTransectionCubit>(),
    ),

    BlocProvider<SelectOtherCubit>(
      create: (_) => SelectOtherCubit(),
      lazy: true,
    ),

    BlocProvider<TimePeriodSelectorCubit>(
      create: (_) => TimePeriodSelectorCubit(),
    ),

    BlocProvider<DropDownCubit>(create: (_) => DropDownCubit(), lazy: true),

    BlocProvider<ChangeProfileWidgetCubit>(
      create: (_) => ChangeProfileWidgetCubit(),
    ),

    BlocProvider<ShowPasswordCubit2>(
      create: (_) => ShowPasswordCubit2(),
      lazy: true,
    ),

    BlocProvider<ProfileDataCubit>(
      create: (_) => serviceLocator<ProfileDataCubit>(),
    ),
    BlocProvider<GetAllExpenseCubit>(
      create: (_) => serviceLocator<GetAllExpenseCubit>(),
    ),
  ];
}
