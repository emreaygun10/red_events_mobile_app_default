import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomProgressPaymentType extends StatelessWidget {
  const CustomProgressPaymentType({
    required this.textTheme,
    required this.text,
    required this.color,
    super.key,
  });

  final TextTheme textTheme;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: const StadiumBorder(),
      labelStyle: textTheme.labelSmall,
      backgroundColor: color,
      side: BorderSide.none,
      label: AutoSizeText(
        text.tr(),
      ),
    );
  }
}
