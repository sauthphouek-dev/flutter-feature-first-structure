import 'package:intl/intl.dart';

/// Class to handle the logic for the [AppTheme] enum.
class AppFormatter {
  /// static method to get format pricing [String] from [double] value.
  static String formatPrice(double value) {
    return value.toStringAsFixed(2);
  }

  /// static method to get format currency [String] from [double] value.
  static String formatCurrency(double value) {
    return value.toStringAsFixed(2);
  }

  /// static method to get format percentage [String] from [double] value.
  static String formatPercentage(double value) {
    return value.toStringAsFixed(2);
  }

  /// static method to get format date [String] from [DateTime] value. from [DateFormat.yMMMMd].
  /// e.g. 2020-01-01 or 2020-Jan-01 from [DateFormat.yMMMMd].
  static String formatDate(DateTime value) {
    return DateFormat.yMMMMd().format(value);
  }
}
