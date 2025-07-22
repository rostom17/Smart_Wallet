import 'package:flutter_bloc/flutter_bloc.dart';

class TabIndexCubit extends Cubit<int> {
  TabIndexCubit() : super(0);

  void onTapCard() {
    emit(0);
  }

  void onTapAccounts() {
    emit(1);
  }
}
