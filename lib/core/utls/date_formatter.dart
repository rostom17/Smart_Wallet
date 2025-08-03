import 'package:intl/intl.dart';

class DateFormatter {
  static String yyyyMMdd(DateTime originalDate) {
    return DateFormat("yyyy-MM-dd").format(originalDate);
  }

  static String mmYYdd(DateTime originalDate) {
    return DateFormat(DateFormat.YEAR_MONTH_DAY).format(originalDate);
  }
}
