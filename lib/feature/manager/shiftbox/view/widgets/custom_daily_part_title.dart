import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomDailyPartTitle extends StatelessWidget {
  const CustomDailyPartTitle({
    required this.text,
    required this.startColor,
    required this.endColor,
    super.key,
  });
  final String text;
  final Color startColor;
  final Color endColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32).h,
      child: Container(
        height: 32.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              startColor,
              endColor,
            ],
          ),
          borderRadius: ProjectBorderRadius.allCircleSmall(),
        ),
        child: Row(
          children: [
            Assets.icons.icDownArrow.toGetSvg(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
