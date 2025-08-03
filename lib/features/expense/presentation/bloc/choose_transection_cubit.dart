import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseTransectionCubit extends Cubit<int?> {
  ChooseTransectionCubit() : super(null);

  void selectTransection(int index) {
    emit(index);
  }
}
