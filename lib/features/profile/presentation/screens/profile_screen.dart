import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/core/constants/app_colors.dart';
import 'package:smart_wallet/core/services/service_locator.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/profile_action_rows.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/profile_screen_header.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/update_profile.dart';
import 'package:smart_wallet/features/common/widgets/background_pattern_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileDataCubit>().getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: BlocBuilder<ChangeProfileWidgetCubit, int>(
          builder: (context, index) {
            return BlocBuilder<ProfileDataCubit, ProfileDataState>(
              builder: (context, state) {
                final widgetScreen = _buildWidgets(state);

                return Column(
                  children: [
                    ProfileScreenHeader(index: index),
                    const SizedBox(height: 20),
                    _buildNameRow(
                      state is ProfileDataLoadedSuccess
                          ? state.user.userName
                          : "Unknown",
                    ),
                    const SizedBox(height: 28),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              ScaleTransition(scale: animation, child: child),
                          child: widgetScreen[index],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildWidgets(ProfileDataState state) {
    final user = state is ProfileDataLoadedSuccess ? state.user : null;

    return [
      const ProfileActionRows(),
      ProfileInfoWidget(
        name: user?.userName ?? "Unknown",
        email: user?.userEmail ?? "",
      ),
      UpdateProfile(
        name: user?.userName ?? "Unknown",
        email: user?.userEmail ?? "",
      ),
    ];
  }

  Widget _buildNameRow(String name) {
    return Column(
      children: [
        Text(name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
        Text(
          "@${name.toLowerCase()}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
