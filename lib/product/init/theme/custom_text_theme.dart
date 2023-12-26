import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_text_style.dart';

final class CustomTextTheme {
  CustomTextTheme._();

  /// Product Text theme
  static final textTheme = TextTheme(
    displayLarge: CustomTextStyle().copyWith(
      fontSize: 56,
      letterSpacing: -1 / 100,
    ),
    displayMedium: CustomTextStyle().copyWith(
      fontSize: 48,
      letterSpacing: -1 / 100,
    ),
    displaySmall: CustomTextStyle().copyWith(
      fontSize: 40,
      letterSpacing: -1 / 100,
    ),
    headlineLarge: CustomTextStyle().copyWith(
      fontSize: 32,
    ),
    headlineMedium: CustomTextStyle().copyWith(
      fontSize: 24,
    ),
    headlineSmall: CustomTextStyle().copyWith(
      fontSize: 20,
    ),
    labelLarge: CustomTextStyle().copyWith(
      fontSize: 18,
      letterSpacing: -15 / 100,
    ),
    labelMedium: CustomTextStyle().copyWith(
      fontSize: 16,
      letterSpacing: -11 / 100,
    ),
    labelSmall: CustomTextStyle().copyWith(
      fontSize: 14,
      letterSpacing: -6 / 1000,
    ),
    bodyLarge: CustomTextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      letterSpacing: -15 / 100,
    ),
    bodyMedium: CustomTextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: -11 / 100,
    ),
    bodySmall: CustomTextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: -6 / 1000,
    ),
    titleLarge: CustomTextStyle().copyWith(
      fontSize: 16,
      letterSpacing: 6 / 100,
    ),
    titleMedium: CustomTextStyle().copyWith(
      fontSize: 14,
      letterSpacing: 6 / 100,
    ),
    titleSmall: CustomTextStyle().copyWith(
      fontSize: 12,
      letterSpacing: 0.25,
    ),
  );
}
