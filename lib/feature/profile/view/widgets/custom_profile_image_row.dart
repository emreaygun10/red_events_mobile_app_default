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
          height: 88.h,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.greenLight, width: 3),
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
                child: Chip(
                  backgroundColor: ColorName.neutral900,
                  label: AutoSizeText(
                    jobText,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorName.neutral0),
                  ),
                  padding: const ProjectPadding.symmetricSmallH(),
                  shape: const StadiumBorder(),
                  side: BorderSide.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
