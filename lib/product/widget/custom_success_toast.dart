import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomSuccessToast extends StatelessWidget {
  const CustomSuccessToast({
    required this.message,
    this.height = 40,
    super.key,
  });

  final String message;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SuccessToast(
      message: message,
      backgroundColor: ColorName.greenLight,
      icon: Assets.icons.icSelectBoxCircleFill.toGetSvg(),
      size: Size(context.sized.width, height.h),
    );
  }
}
