import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:widgets/widgets.dart';

class CustomPersonelDayContainerWithAddShift extends StatelessWidget {
  const CustomPersonelDayContainerWithAddShift({
    required this.textTheme,
    required this.weaklyShiftType,
    super.key,
  });

  final TextTheme textTheme;
  final WeaklyShiftType weaklyShiftType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ).r,
        decoration: BoxDecoration(
          color: ColorName.neutral100,
          border: Border.all(
            color: ColorName.neutral200,
          ),
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 36.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    '20',
                    style: textTheme.labelLarge!.copyWith(
                      color: ColorName.neutral400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  AutoSizeText(
                    'PZT',
                    style: textTheme.titleSmall!.copyWith(
                      color: ColorName.neutral400,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalDivider(),
            if (weaklyShiftType == WeaklyShiftType.empty)
              TextButton(
                onPressed: () => context.router.push(
                  ShiftPermissionRoute(
                    fromTheView: FromTheView.weaklyView,
                  ),
                ),
                child: Text(
                  '+ Shift Ekle',
                  style: textTheme.titleMedium!
                      .copyWith(color: ColorName.blueDark),
                ),
              )
            else
              Expanded(
                child: Container(
                  padding: const ProjectPadding.allSmall().r,
                  decoration: BoxDecoration(
                    color: ColorName.neutral200,
                    border: Border.all(color: ColorName.neutral300),
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: Center(
                    child: Text(
                      'İZİNLİ',
                      style: textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
