import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomAutoSizeTextForTitle extends StatelessWidget {
  const CustomAutoSizeTextForTitle({
    required String text,
    super.key,
  }) : _text = text;

  final String _text;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      _text.tr(),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
