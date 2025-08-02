import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/common/widgets/custom_app_bar.dart';
import 'package:smart_wallet/features/profile/presentation/bloc/change_profile_widget_cubit.dart';

class ProfileScreenHeader extends StatelessWidget {
  const ProfileScreenHeader({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          appBarName: "Profile",
          onTapBackButton: () {
            context.read<ChangeProfileWidgetCubit>().onPressedBackButton(
              index,
              context,
            );
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
      ],
    );
  }
}
