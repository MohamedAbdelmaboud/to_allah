import 'package:intl/intl.dart';

String dateToString(DateTime date) {
  return DateFormat('dd MMMM yyyy').format(date);
}
