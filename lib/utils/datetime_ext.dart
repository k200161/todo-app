extension FormatDateExt on DateTime {
  DateTime get normalized => DateTime(year, month, day);

  String get numericDate => '$day/$month/$year ';

  String get dateFormatedLong => '$day ${monthName.substring(0, 3)} $year';

  String get dateFormatedWithWeek => '${weekdayName.substring(0, 3)} $day';

  String get dateFormated => '$day $monthName';

  String get timeFormated => '$hour:$minute';

  String get weekdayName => _weekdayName[weekday]!;

  String get monthName => _monthName[month]!;

  String rangeTill(DateTime endTime) {
    if (year != endTime.year) return '$dateFormatedLong to ${endTime.dateFormatedLong}';
    if (month != endTime.month) return '$dateFormated to ${endTime.dateFormated}';
    if (day != endTime.day) return '$dateFormatedWithWeek to ${endTime.dateFormatedWithWeek}';
    return 'Right now';
  }
}

final _monthName = {
  DateTime.january: 'January',
  DateTime.february: 'February',
  DateTime.march: 'March',
  DateTime.april: 'April',
  DateTime.may: 'May',
  DateTime.june: 'June',
  DateTime.july: 'July',
  DateTime.august: 'August',
  DateTime.september: 'September',
  DateTime.october: 'October',
  DateTime.november: 'November',
  DateTime.december: 'December',
};

final _weekdayName = {
  DateTime.monday: 'Monday',
  DateTime.tuesday: 'Tuesday',
  DateTime.wednesday: 'Wednesday',
  DateTime.thursday: 'Thursday',
  DateTime.friday: 'Friday',
  DateTime.saturday: 'Saturday',
  DateTime.sunday: 'Sunday',
};
