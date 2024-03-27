import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomBottomSheetContainer extends StatelessWidget {
  const CustomBottomSheetContainer({
    required this.hintText,
    required this.onTap,
    super.key,
    this.selectedText,
  });
  final String hintText;
  final String? selectedText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricMediumV(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10).copyWith(left: 12).r,
          height: 48.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.neutral200),
            borderRadius: ProjectBorderRadius.allCircleMedium(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                selectedText ?? hintText.tr(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: selectedText.ext.isNullOrEmpty
                          ? FontWeight.w500
                          : FontWeight.w600,
                    ),
              ),
              Assets.icons.icDownArrow.toGetSvg(),
            ],
          ),
        ),
      ),
    );
  }
}
