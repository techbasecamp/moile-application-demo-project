import 'package:intl/intl.dart';

class TextUtil {
  String handleOverflow(String raw, int limit) {
    return raw.length <= limit ? raw : raw.substring(0, limit) + "...";
  }

  String formatNumber(int number, {int? limit}) {
    int _number = number;
    bool shouldAdjustNumber = limit != null && number > limit;
    if (shouldAdjustNumber) _number = limit;
    String str = NumberFormat.currency(decimalDigits: 0)
        .format(_number)
        .replaceAll("USD", "")
        .toString();
    if (shouldAdjustNumber) str = str + "+";
    return str;
  }
}
