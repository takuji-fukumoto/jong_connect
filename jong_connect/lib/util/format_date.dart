import 'package:intl/intl.dart';

class DateFormatter {
  late final DateTime _date;

  DateFormatter(DateTime date) {
    // MEMO: ここでローカル時間に戻す
    _date = date.toLocal();
  }

  String formatToYYYYMMDDHHmm() {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日 HH:mm');
    return outputFormat.format(_date);
  }

  String formatToYYYYMMDD() {
    DateFormat outputFormat = DateFormat('yyyy年MM月dd日');
    return outputFormat.format(_date);
  }

  String formatToMMDD() {
    DateFormat outputFormat = DateFormat('MM月dd日');
    return outputFormat.format(_date);
  }

  String formatToHm() {
    DateFormat outputFormat = DateFormat('H:m');
    return outputFormat.format(_date);
  }
}
