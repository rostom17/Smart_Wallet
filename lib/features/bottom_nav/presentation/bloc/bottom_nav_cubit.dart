import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  int _previousIndex = 0;

  int get previousIndex => _previousIndex;
  int get currentIndex => state;

  void onTabChanged(int newIndex) {
    if (newIndex != state) {
      _previousIndex = state;
      emit(newIndex);
    }
  }
}
