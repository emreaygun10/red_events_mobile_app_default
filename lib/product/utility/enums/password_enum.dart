import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Project password enum
enum PasswordLevel {
  /// Weak password
  weak(LocaleKeys.sign_password_weak),

  /// insufficient password
  middle(LocaleKeys.sign_password_middle),

  ///Strong password
  strong(LocaleKeys.sign_password_strong);

  /// Base url query
  final String value;

  /// Query construct
  const PasswordLevel(this.value);
}
