import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_color_scheme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_text_theme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_theme.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/font_family.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.inter.value,
        textTheme: CustomTextTheme.textTheme,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
