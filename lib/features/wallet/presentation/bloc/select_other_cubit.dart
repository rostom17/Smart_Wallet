import 'package:flutter_bloc/flutter_bloc.dart';

class SelectOtherCubit extends Cubit<bool> {
  SelectOtherCubit() : super(false);

  void showOtherAmountInput() {
    emit(true);
  }

  void hideOtherAmountInput() {
    emit(false);
  }
}
