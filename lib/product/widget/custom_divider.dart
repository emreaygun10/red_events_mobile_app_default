import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Divider(
        color: ColorName.neutral900,
        height: 10.h,
      ),
    );
  }
}
