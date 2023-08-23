import 'package:intl/intl.dart';

String parseDateTimeToMonthDayYear(String dateStr) {
  final dateTime = DateFormat('yyyy-MM-dd').parse(dateStr);
  return DateFormat('MMMM d, yyyy').format(dateTime);
}
