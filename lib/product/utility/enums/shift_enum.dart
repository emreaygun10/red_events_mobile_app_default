import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

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

/// Weakly Shift Type enum
enum JobStatus {
  /// no problem
  onTime('Geldi', ColorName.greenLight, ColorName.greenDark),

  /// late
  late('Geç Geldi', ColorName.orangeLight, ColorName.orangeDark),

  /// not come
  notCome('Gelmedi', ColorName.redLight, ColorName.redDark);

  /// day typw
  final String status;
  final Color color;
  final Color dotColor;

  const JobStatus(this.status, this.color, this.dotColor);
}

/// Select whic view come from view
enum FromTheView {
  personelDetail('Kaydet', 'Shift Düzenle'),

  weaklyView('Ekle', 'Shift / İzin Ekle');

  final String buttonText;
  final String appBarText;

  const FromTheView(this.buttonText, this.appBarText);
}

enum OperationsEnum {
  specialScreen('Ekranı Özelleştir'),
  sendGbt('GBT Gönder'),
  download('İndir'),
  sendShift('Personellere Shiftlerini Gönder'),
  addPersonnel('Personel Ekle');

  final String text;

  const OperationsEnum(this.text);
}
