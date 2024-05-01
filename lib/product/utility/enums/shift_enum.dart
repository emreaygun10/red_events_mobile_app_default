/// Shift Time Chip enum
enum ShiftTimeEnum {
  /// chips text
  onTime(),
  late(),
  report(),
  notcome(),
  empty();

  // ignore: sort_constructors_first
  const ShiftTimeEnum();
}

/// Weakly Shift Type enum
enum WeaklyShiftType {
  /// empty
  empty('BOŞ'),

  /// off
  off('İZİN');

  /// day typw
  final String type;
  const WeaklyShiftType(this.type);
}
