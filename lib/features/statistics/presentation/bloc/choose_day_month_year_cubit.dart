import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDayMonthYearCubit extends Cubit<int> {
  ChooseDayMonthYearCubit() : super(0);

  void onChangedIndex(int index) {
    emit(index);
  }
}
