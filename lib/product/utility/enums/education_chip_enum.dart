import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Education Chip enum
enum EducationChips {
  /// chips text
  waiting(LocaleKeys.profile_education_chip_waiting),
  continuos(LocaleKeys.profile_education_chip_continue),
  completed(LocaleKeys.profile_education_chip_completed);

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const EducationChips(this.value);
}
