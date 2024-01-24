import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomMissingDocumentItem extends StatelessWidget {
  const CustomMissingDocumentItem({
    required this.textTheme,
    required this.title,
    required this.desc,
    super.key,
  });

  final TextTheme textTheme;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12).r,
        padding: const ProjectPadding.allMedium(),
        color: ColorName.neutral300,
        dashPattern: const [8, 8, 8, 8],
        child: ClipRRect(
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const ProjectPadding.allSmall(),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.neutral100,
                    ),
                    child: Assets.icons.icFile.toGetSvg(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        style: textTheme.headlineSmall,
                      ),
                      AutoSizeText(
                        desc,
                        style: textTheme.titleSmall!
                            .copyWith(color: ColorName.neutral400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: DottedBorder(
                  color: ColorName.blueBase,
                  padding: const ProjectPadding.allSmall(),
                  borderType: BorderType.Circle,
                  dashPattern: const [8, 8, 8, 8],
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: ColorName.blueBase,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
