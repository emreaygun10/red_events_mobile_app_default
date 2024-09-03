import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

final class CustomBottomSheetTimer extends StatelessWidget {
  const CustomBottomSheetTimer({
    this.hintText,
    this.selectedHour,
    this.onTap,
    super.key,
  });
  final String? hintText;
  final String? selectedHour;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        GestureDetector(
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
              children: [
                const Icon(Icons.access_time),
                SizedBox(
                  width: 12.w,
                ),
                AutoSizeText(
                  selectedHour ?? hintText.toString().tr(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: selectedHour.ext.isNullOrEmpty
                            ? FontWeight.w500
                            : FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
