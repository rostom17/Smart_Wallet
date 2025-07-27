import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_wallet/core/constans/app_colors.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/profile_action_rows.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:smart_wallet/features/profile/presentation/widgets/update_profile.dart';
import 'package:smart_wallet/features/shared/widgets/background_pattern_widget.dart';
import 'package:smart_wallet/features/shared/widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<Widget> widgetScreen = [
    ProfileActionRows(),
    ProfileInfoWidget(),
    UpdateProfile(
      name: "Rostom ALi",
      email: "rostom2384@gmail.com",
      password: "123456677",
      numberOfCards: 5,
      numberOfBankAccount: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundPatternWidget(
      yourWidgetTree: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: BlocBuilder<ChangeProfileWidgetCubit, int>(
          builder: (context, index) {
            return Column(
              children: [
                CustomAppBar(
                  appBarName: "Profile",
                  onTapBackButton: () {
                    context
                        .read<ChangeProfileWidgetCubit>()
                        .onPressedBackButton(index, context);
                  },
                  onTapNotificationButton: () {},
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://www.hollywoodreporter.com/wp-content/uploads/2024/02/sq110_s300_f206_2K_final-H-2024.jpg?w=1296&h=730&crop=1",
                      ),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) =>
                          CircleAvatar(child: Icon(Icons.person)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Rostom Ali",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Text(
                  "@rostom_ali",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 28),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                              scale: animation,
                              child: child,
                            );
                            // return FadeTransition(
                            //   opacity: animation,
                            //   child: child,
                            // );
                          },
                      child: widgetScreen[index],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
