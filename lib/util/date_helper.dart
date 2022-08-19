import 'package:intl/intl.dart';
class DateHelper{
  static String serverDateFormat ="yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

  String getDateStringFromServerDateFormat(String serverDate,DateStringFormat format){
    DateTime parseDate = DateFormat(serverDateFormat).parse(serverDate);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat(_getDateFormatString(format));
    return  outputFormat.format(inputDate);
  }

  String _getDateFormatString(DateStringFormat format) {
    switch (format){
      case DateStringFormat.onlyDate: return "yyyy. MM. dd.";
      case DateStringFormat.fullDateTime: return "yyyy.MM.dd hh:mm a";
    }
  }
}

enum DateStringFormat{
  fullDateTime, onlyDate
}