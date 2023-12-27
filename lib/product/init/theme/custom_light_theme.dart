import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_color_scheme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_text_theme.dart';
import 'package:red_events_mobile_app_defult/product/init/theme/custom_theme.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/font_family.dart';
import 'package:widgets/widgets.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.inter.value,
        textTheme: CustomTextTheme.textTheme,
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        inputDecorationTheme: inputDecorationTheme,
        elevatedButtonTheme: elevatedButtonThemeData,
      );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData();

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   borderSide: BorderSide(
        //     color: ColorName.neutral200,
        //   ),
        // ),
        border: InputBorder.none,
        fillColor: ColorName.blueLighter,
        outlineBorder: const BorderSide(color: ColorName.neutral400),
        labelStyle: TextStyle(
          color: ColorName.neutral900,
          fontFamily: FontFamily.inter.value,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ProjectBorderRadius.allCircleSmall(),
          borderSide: const BorderSide(
            color: ColorName.redBase,
          ),
        ),
        // enabledBorder: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10)),
        //   borderSide: BorderSide(
        //     color: ColorName.neutral200,
        //   ),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ProjectBorderRadius.allCircleSmall(),
          borderSide: const BorderSide(
            color: ColorName.blueBase,
          ),
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          backgroundColor: ColorName.blueBase,
          shape: RoundedRectangleBorder(
            borderRadius: ProjectBorderRadius.allCircleLarge(),
            side: const BorderSide(color: ColorName.neutral0),
          ),
        ),
      );
}
