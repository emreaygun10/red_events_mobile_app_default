import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.url,
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 48.w,
      child: Stack(
        children: [
          Align(
            child: SizedBox(
              height: 48.h,
              width: 48.w,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    url,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 16.h,
              width: 27.w,
              decoration: BoxDecoration(
                borderRadius: ProjectBorderRadius.allCircleLarge(),
                color: ColorName.neutral100,
              ),
              child: const Center(child: AutoSizeText('24')),
            ),
          ),
        ],
      ),
    );
  }
}
