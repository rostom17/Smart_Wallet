import 'package:flutter_bloc/flutter_bloc.dart';

class AccountOptionCubit extends Cubit <int?>{
  AccountOptionCubit() : super(2);

  void onSelectBankLink() {
    emit(0);
  }

  void onSelectPaypal() {
    emit(1);
  }
}
