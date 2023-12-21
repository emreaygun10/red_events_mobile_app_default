import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration
enum Locales {
  /// Turkish language
  tr(Locale('tr', 'TR')),

  /// English language
  en(Locale('en', 'US'));

  /// locale variable
  final Locale locale;

  /// Project supported locale enum
  const Locales(this.locale);
}
