import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownCubit extends Cubit<String> {
  List<String> options = ["Expenses", "Earnings"];

  DropDownCubit() : super("Expenses");

  void onChangedValue(String value) {
    emit(value);
  }
}
