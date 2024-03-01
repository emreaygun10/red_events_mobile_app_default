import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Welcome Step Enums
enum WelcomeSetupListEnum {
  selectPackage(LocaleKeys.setup_select_package),
  infoCompany(LocaleKeys.setup_company_info_title),
  workType(LocaleKeys.setup_work_type),
  notification(LocaleKeys.setup_notifications),
  personnels(LocaleKeys.setup_personnel);

  /// double value
  final String value;

  ///
  const WelcomeSetupListEnum(this.value);
}
