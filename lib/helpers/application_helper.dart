import 'package:intl/intl.dart';

class ApplicationHelper {
  static bool isEmailValid(String email) {
    bool result = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return result;
  }

  static String formatDate(DateTime date) {
    var formatter = new DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(date);

    return formatted;
  }

  static String formatDateWithHours(DateTime date) {
    var formatter = new DateFormat('dd/MM/yyyy kk:mm');
    String formatted = formatter.format(date);

    return formatted;
  }

  static String formatStringDateWithHours(String date) {
    var parsedDate = DateTime.parse(date);
    var formatter = new DateFormat('dd/MM/yyyy kk:mm');
    String formatted = formatter.format(parsedDate);

    return formatted;
  }

  static String formatDateToWeekDay(DateTime date) {
    var formatter = new DateFormat(DateFormat.WEEKDAY);
    String formatted = formatter.format(date);

    return formatted;
  }

  static DateTime buildDate(String date) {
    var parsedDate = DateTime.parse(date);
    return parsedDate;
  }
}
