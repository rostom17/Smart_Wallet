import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSelectorCubit extends Cubit<int?> {
  AccountSelectorCubit() : super(null);

  void onSelectBankLink() {
    emit(0);
  }

  void onSelectPaypal() {
    emit(1);
  }
}
