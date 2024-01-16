import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

class CustomProfileHeader extends StatelessWidget {
  const CustomProfileHeader({
    required this.columnList,
    super.key,
  });
  final List<Widget> columnList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      width: context.sized.width,
      color: ColorName.neutral0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columnList,
      ),
    );
  }
}
