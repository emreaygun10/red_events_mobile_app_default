import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

final class CustomPerformanceCell extends StatelessWidget {
  const CustomPerformanceCell({
    required this.widget,
    super.key,
  });
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      padding:
          const ProjectPadding.symmetricMediumH().copyWith(top: 8, bottom: 8).r,
      child: widget,
    );
  }
}
