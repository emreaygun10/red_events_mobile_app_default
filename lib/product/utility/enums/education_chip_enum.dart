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

/// Request Chip enum
enum RequestChips {
  /// chips text
  waiting(LocaleKeys.profile_requests_chip_waiting),
  reject(LocaleKeys.profile_requests_chip_rejected),
  approved(LocaleKeys.profile_requests_chip_approved);

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const RequestChips(this.value);
}

/// Notification Chip enum
enum NotificationChips {
  /// chips text
  all(LocaleKeys.profile_notifications_chip_all),
  notRead(LocaleKeys.profile_notifications_not_read),
  read(LocaleKeys.profile_notifications_read);

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const NotificationChips(this.value);
}

/// Request Chip enum
enum RequestStringEnum {
  /// chips text
  requestToLeave(LocaleKeys.profile_requests_request_type_request_to_leave),
  requestToPermisson(
    LocaleKeys.profile_requests_request_type_request_to_permission,
  ),
  requestToAdvancePayment(
    LocaleKeys.profile_requests_request_type_request_to_advance_payment,
  ),
  reportNotification(
    LocaleKeys.profile_requests_request_type_report_notification,
  );

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const RequestStringEnum(this.value);
}

/// Progress Payment Chip enum
enum ProgressPaymentChipEnum {
  /// chips text
  progress(LocaleKeys.profile_progress_payment_chips_payment),
  payroll(LocaleKeys.profile_progress_payment_chips_payroll);

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const ProgressPaymentChipEnum(this.value);
}
