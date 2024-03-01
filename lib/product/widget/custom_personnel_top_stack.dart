import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

class CustomPersonnelTopStack extends StatelessWidget {
  const CustomPersonnelTopStack({
    required this.linearProgressEnum,
    required this.text,
    this.maxLevel = '3',
    super.key,
  });
  final LinearProgressEnum linearProgressEnum;
  final String text;
  final String maxLevel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sized.height / 3.9,
      child: Stack(
        children: [
          const BuildTopLinearGradient(),
          buildBaseTopTexts(context, text),
        ],
      ),
    );
  }

  Padding buildBaseTopTexts(BuildContext context, String text) {
    return Padding(
      padding: const ProjectPadding.scaffold().r,
      child: SizedBox(
        width: context.sized.width,
        child: Column(
          children: [
            SizedBox(
              height: 127.h,
            ),
            buildTitle(context, text),
            SizedBox(
              height: 8.h,
            ),
            buildRow(context, linearProgressEnum),
          ],
        ),
      ),
    );
  }

  Flexible buildRow(BuildContext context, LinearProgressEnum level) {
    return Flexible(
      child: SizedBox(
        height: 16,
        width: 264,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 170.w,
              child: LinearProgressIndicator(
                value: level.value,
                backgroundColor: ColorName.neutral300,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(ColorName.blueBase),
              ),
            ),
            AutoSizeText(
              LocaleKeys.add_personnel_base_inform_linear_progress.tr(
                args: [level.step.toString(), maxLevel],
              ),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorName.neutral400),
            ),
          ],
        ),
      ),
    );
  }
}

Flexible buildTitle(BuildContext context, String text) {
  return Flexible(
    child: AutoSizeText(
      text.tr(),
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontWeight: FontWeight.w500),
      textAlign: TextAlign.center,
      maxLines: 1,
    ),
  );
}
