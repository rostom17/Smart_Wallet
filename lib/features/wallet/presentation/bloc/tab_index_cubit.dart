import 'package:flutter_bloc/flutter_bloc.dart';

class TabIndexCubit extends Cubit<int> {
  TabIndexCubit({required this.selectedIndex}) : super(selectedIndex);

  final int selectedIndex;

  void onTapCard() {
    emit(0);
  }

  void onTapAccounts() {
    emit(1);
  }
}
