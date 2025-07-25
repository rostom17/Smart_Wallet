import 'package:flutter_bloc/flutter_bloc.dart';

class ShowPasswordCubit2 extends Cubit<bool> {
  ShowPasswordCubit2() : super(false);

  void togglePasswordVisibility() {
    emit(!state);
  }
}
