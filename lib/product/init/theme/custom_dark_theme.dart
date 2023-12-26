import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
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
        inputDecorationTheme: inputDecorationTheme,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: InputBorder.none,
        outlineBorder: const BorderSide(color: ColorName.neutral200),
        labelStyle: TextStyle(
          color: ColorName.neutral900,
          fontFamily: FontFamily.inter.value,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorName.redBase,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorName.blueBase,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: ColorName.neutral200,
          ),
        ),
        fillColor: ColorName.blueLight,
      );
}
