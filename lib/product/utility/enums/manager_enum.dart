import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Manager Hr Bottom Sheet Enums
enum HrBottomSheetEnum {
  pushNotification(LocaleKeys.manager_bottom_shhet_push_notification_title),
  pushFile(LocaleKeys.manager_bottom_shhet_push_file),
  pushGBT(LocaleKeys.manager_bottom_shhet_push_gbt),
  downloadExcel(LocaleKeys.manager_bottom_shhet_donwload_excel);

  /// double value
  final String value;

  ///
  const HrBottomSheetEnum(this.value);
}
