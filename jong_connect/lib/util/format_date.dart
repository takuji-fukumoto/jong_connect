import 'package:intl/intl.dart';

class DateFormatter {
  final DateTime _date;

  const DateFormatter(this._date);

  String formatToYYYYMMDD() {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    return outputFormat.format(_date);
  }

  String formatToHm() {
    DateFormat outputFormat = DateFormat('H:m');
    return outputFormat.format(_date);
  }
}
