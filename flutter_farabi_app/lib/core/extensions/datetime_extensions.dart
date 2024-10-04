import 'package:intl/intl.dart';

extension DatetimeExtensions on DateTime {
  String get timeAgo {
    final a = DateFormat('yyyy-MM-dd hh:mm:ss').format(this);
    final result = DateTime.parse(a);
    final b = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
    final result2 = DateTime.parse(b);
    Duration diff = result2.difference(result).abs();

    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "an" : "ans"}";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "mois" : "mois"}";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "semaine" : "semaines"}";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "jour" : "jours"}";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "heure" : "heures"}";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"}";
    }
    return '${diff.inSeconds} secondes';
  }
}
