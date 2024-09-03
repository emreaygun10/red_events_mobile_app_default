import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomOccupancyWidget extends StatelessWidget {
  const CustomOccupancyWidget({
    required this.mainText,
    required this.occupancy,
    super.key,
  });

  final String mainText;
  final String occupancy;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      height: 56.h,
      width: context.sized.width,
      padding: const ProjectPadding.allNormal().copyWith(top: 16, bottom: 16).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Assets.icons.icCalendar
                  .toGetSvgWithColor(color: ColorName.blueBase),
              Padding(
                padding: const ProjectPadding.symmetricXSmallH()
                    .copyWith(right: 0)
                    .r,
                child: AutoSizeText(
                  mainText,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 37.w,
                height: 6.h,
                child: const LinearProgressIndicator(
                  backgroundColor: ColorName.neutral200,
                  color: ColorName.blueBase,
                  value: 0.4,
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricXSmallH()
                    .copyWith(right: 0)
                    .r,
                child: AutoSizeText(
                  '$occupancy/100',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral400,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
