import 'package:flutter_bloc/flutter_bloc.dart';

class OtherOptionCubit extends Cubit<bool> {
  OtherOptionCubit() : super(false);

  void shoeOtherAmountInput() {
    emit(true);
  }

  void hideOtherAmountInput() {
    emit(false);
  }
}
