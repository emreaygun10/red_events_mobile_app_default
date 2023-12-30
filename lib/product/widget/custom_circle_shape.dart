import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomBuildCircleShape extends StatelessWidget {
  const CustomBuildCircleShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: 88.h,
            height: 88.w,
            decoration: BoxDecoration(
              color: ColorName.neutral100.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const ProjectPadding.allMedium(),
              child: Container(
                width: 56.h,
                height: 56.w,
                decoration: const BoxDecoration(
                  color: ColorName.greenBase,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const ProjectPadding.allMedium(),
                  child: Assets.icons.icCheckLine
                      .svg(package: ModuleEnum.gen.value),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
