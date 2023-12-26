import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/font_family.dart';

/// Custom Text Style Class
final class CustomTextStyle extends TextStyle {
  /// Custom Text Style construct
  CustomTextStyle()
      : super(
          fontFamily: FontFamily.inter.value,
          fontWeight: FontWeight.w500,
          color: ColorName.neutral900,
        );
}
