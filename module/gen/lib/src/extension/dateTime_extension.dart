extension DateTimeExtensions on DateTime {
  DateTime addMonths(int months) {
    if (isUtc) {
      return DateTime.utc(
        year,
        month + months,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    } else {
      return DateTime(
        year,
        month + months,
        day,
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }

  DateTime addWeeks(int week) {
    if (isUtc) {
      return DateTime.utc(
        year,
        month,
        day + (week * 7),
        hour,
        minute,
        second,
        millisecond,
      );
    } else {
      return DateTime(
        year,
        month,
        day + (week * 7),
        hour,
        minute,
        second,
        millisecond,
      );
    }
  }
}
