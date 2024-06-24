extension DateTimeExtension on DateTime {
  String getDaysString() {
    switch (weekday) {
      case 1:
        return 'PZT';
      case 2:
        return 'SALI';
      case 3:
        return 'ÇRŞ';
      case 4:
        return 'PRŞ';
      case 5:
        return 'CUM';
      case 6:
        return 'CMT';
      case 7:
        return 'PZR';
      default:
        return 'Err';
    }
  }
}
