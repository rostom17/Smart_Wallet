import 'package:flutter_bloc/flutter_bloc.dart';

class TransectionCardIndexCubit extends Cubit<int> {
  TransectionCardIndexCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
