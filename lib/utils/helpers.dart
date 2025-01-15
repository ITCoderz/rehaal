import 'package:intl/intl.dart';

class Helpers {
 String parseAndFormatDate(String dateStr) {
  try {
    // Assuming the input format is 'dd/MM/yyyy'
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(parsedDate);  // Correct ISO format
  } catch (e) {
    print('Invalid date format: $dateStr');
    return '';  // Return empty or a default date
  }
}

bool isPastDate(String dateStr) {
  String formattedDate = parseAndFormatDate(dateStr);
  if (formattedDate.isNotEmpty) {
    DateTime date = DateTime.parse(formattedDate);
    return date.isBefore(DateTime.now());
  }
  return false;
}
}
