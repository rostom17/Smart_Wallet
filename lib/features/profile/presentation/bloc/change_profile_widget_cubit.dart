import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_wallet/features/bottom_nav/presentation/bloc/bottom_nav_cubit.dart';

class ChangeProfileWidgetCubit extends Cubit<int> {
  ChangeProfileWidgetCubit() : super(0);

  void onPressedAccountInfo() {
    emit(1);
  }

  void onPressedEditProfile() {
    emit(2);
  }

  void onPressedBackButton(int index, BuildContext context) {
    if (index == 0) {
      context.read<BottomNavCubit>().onTabChanged(0);
      return;
    }
    if (index == 1) {
      emit(0);
      return;
    }
    if (index == 2) {
      emit(1);
      return;
    }
  }
}
