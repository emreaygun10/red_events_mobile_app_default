import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/utility/constants/enums/locales.dart';

/// Easy Localization manager
final class ProductLocalization extends EasyLocalization {
  ///
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: supportedItems,
          startLocale: Locales.tr.locale,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  /// Supported locale list
  static final List<Locale> supportedItems = [
    Locales.tr.locale,
    // Locales.en.locale,
  ];

  static const String _translationPath = 'asset/translations';

  /// Change project language by [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
