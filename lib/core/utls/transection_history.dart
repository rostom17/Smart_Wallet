import 'dart:math';

import 'package:smart_wallet/core/constants/app_strings.dart';

class TransectionHistoryUtl {
  static List<String> transections = [
    AppStrings.upworkLogo,
    AppStrings.personLogo,
    AppStrings.youtubeLogo,
    AppStrings.personLogo,
    AppStrings.fiverrLogo,
    AppStrings.cinemaLogo,
    AppStrings.clothesLogo,
    AppStrings.paypalLogo,
    AppStrings.burgerLogo,
    AppStrings.salaryLogo,
    AppStrings.traveLogo,
  ];

  static int get iconIndex {
    Random random = Random();
    return random.nextInt(transections.length);
  }
}
