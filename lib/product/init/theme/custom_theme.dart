import 'package:flutter/material.dart';

abstract class CustomTheme {
  ThemeData get themeData;

  ///Custom Theme Floating action button theme data
  FloatingActionButtonThemeData get floatingActionButtonThemeData;

  /// Custom Theme Input Decoration theme data
  InputDecorationTheme get inputDecorationTheme;

  /// Custom Theme Elevated Button theme data
  ElevatedButtonThemeData get elevatedButtonThemeData;
}
