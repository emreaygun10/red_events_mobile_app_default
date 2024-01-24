import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';

/// Documents Chip enum
enum DocumentsChipEnum {
  /// chips text
  loaded(LocaleKeys.add_personnel_document_loaded_documents),
  missing(LocaleKeys.add_personnel_document_missing_documents);

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const DocumentsChipEnum(this.value);
}
