// ignore_for_file: public_member_api_docs

import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomContainerChip extends StatelessWidget {
  const CustomContainerChip({
    required this.chipIndex,
    required this.text,
    required this.onTap,
    super.key,
  });

  final bool chipIndex;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 160.w,
        padding: const ProjectPadding.customChipPaddingLarge(),
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          color: chipIndex ? ColorName.blueBase : ColorName.neutral200,
        ),
        child: Center(
          child: AutoSizeText(
            text.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: chipIndex ? ColorName.neutral0 : ColorName.neutral900,
                ),
          ),
        ),
      ),
    );
  }
}
