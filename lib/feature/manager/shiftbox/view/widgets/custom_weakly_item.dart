import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:widgets/widgets.dart';

class CustomWeaklyItem extends StatelessWidget {
  const CustomWeaklyItem({
    required this.day,
    this.hour,
    this.type,
    super.key,
  });
  final String day;
  final String? hour;
  final WeaklyShiftType? type;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 18.r,
          child: Assets.icons.icWeaklySubtract.toGetSvgWithColor(
            color: hour != null
                ? const Color(0xFF4C7A96)
                : type == WeaklyShiftType.empty
                    ? ColorName.neutral300
                    : ColorName.neutral200,
            width: 31.5.w,
            height: 7.h,
          ),
        ),
        Assets.icons.icWeaklyUnion.toGetSvgWithColor(
          color: hour != null
              ? const Color(0xFF4C7A96)
              : type == WeaklyShiftType.empty
                  ? ColorName.neutral300
                  : ColorName.neutral200,
          height: 44.h,
        ),
        Positioned(
          top: 23.r,
          child: Container(
            height: 14.5.h,
            width: 28.w,
            decoration: BoxDecoration(
              color: ColorName.neutral100,
              border: Border.all(color: ColorName.neutral200),
              borderRadius: ProjectBorderRadius.allCircleLarge(),
            ),
            child: Center(
              child: Text(
                day,
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 17.r,
          child: Text(
            hour == null ? type!.type : hour.toString(),
            style: TextStyle(fontSize: 11.sp),
          ),
        ),
      ],
    );
  }
}
