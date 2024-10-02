import 'package:intl/intl.dart';

/// * Outputs something like: 12/03/2024 - 14h30
class TimeConvertion {
  static String historyConvert(DateTime date) =>
      DateFormat('dd/MM/yyyy - HH\'h\'mm').format(date);
}
