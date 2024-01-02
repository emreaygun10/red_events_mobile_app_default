import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

/// Custom Tap Stack Class
class CustomTopStack extends StatelessWidget {
  const CustomTopStack({
    required this.title,
    required this.desc,
    super.key,
    this.titleArgs,
    this.descArgs,
  });
  final String title;
  final String desc;
  final Map<String, String>? titleArgs;
  final Map<String, String>? descArgs;

  @override
  Widget build(BuildContext context) {
    return buildTopStack(context);
  }

  SizedBox buildTopStack(BuildContext context) {
    return SizedBox(
      height: context.sized.height / 3.2,
      child: Stack(
        children: [
          const BuildTopLinearGradient(),
          buildBaseTopTexts(context),
        ],
      ),
    );
  }

  Padding buildBaseTopTexts(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold().r,
      child: SizedBox(
        width: context.sized.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 127.h,
            ),
            buildTitle(context),
            buildTitleDesc(context),
          ],
        ),
      ),
    );
  }

  Flexible buildTitleDesc(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 242.w,
        child: AutoSizeText(
          desc.tr(namedArgs: descArgs),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Flexible buildTitle(BuildContext context) {
    return Flexible(
      child: AutoSizeText(
        title.tr(namedArgs: titleArgs),
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        maxLines: 1,
      ),
    );
  }
}
