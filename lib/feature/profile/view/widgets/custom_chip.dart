// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

final class CustomChip extends StatelessWidget {
  const CustomChip({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const ProjectPadding.customChipPadding().r,
      label: AutoSizeText(
        text,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: ColorName.neutral500),
      ),
      backgroundColor: ColorName.neutral100,
      shape: const StadiumBorder(),
      side: BorderSide.none,
    );
  }
}
