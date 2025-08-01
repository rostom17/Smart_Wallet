import 'package:flutter_bloc/flutter_bloc.dart';

class TimePeriodSelectorCubit extends Cubit<int> {
  TimePeriodSelectorCubit() : super(2);

  void onChangedIndex(int index) {
    emit(index);
  }
}
