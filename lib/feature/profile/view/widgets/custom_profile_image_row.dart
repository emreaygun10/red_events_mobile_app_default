// ignore_for_file: public_member_api_docs

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

final class CustomProfileImageRow extends StatelessWidget {
  const CustomProfileImageRow({
    required this.jobText,
    required this.imageUrl,
    super.key,
  });
  final String jobText;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100.h,
          width: 85.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 90.h,
                width: 90.w,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.success, width: 5),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorName.neutral900,
                    borderRadius: ProjectBorderRadius.allCircleLarge(),
                  ),
                  padding: const ProjectPadding.customChipPaddingLarge(),
                  child: AutoSizeText(
                    jobText,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorName.neutral0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                  height: 32.h,
                  width: 32.w,
                  child: Assets.icons.icTopRightStart.toGetSvg(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
