import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Manager Hr Bottom Sheet Enums
enum HrBottomSheetEnum {
  pushNotification(LocaleKeys.manager_bottom_sheet_push_notification_title),
  pushFile(LocaleKeys.manager_bottom_sheet_push_file_push_file_title),
  pushGBT(LocaleKeys.manager_bottom_sheet_push_gbt_title),
  downloadExcel(LocaleKeys.manager_bottom_sheet_donwload_excel_title);

  /// double value
  final String value;

  ///
  const HrBottomSheetEnum(this.value);
}
