import 'package:intl/intl.dart';

class DataHelper {
  static String dateToDMA({required String date}) {
    DateTime data = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(data);
  }

  static String dateToHourMin({required String date}) {
    DateTime data = DateTime.parse(date);
    return DateFormat('hh:mm').format(data);
  }
}
