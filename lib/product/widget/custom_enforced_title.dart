import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_enforced_star.dart';

class CustomEnforcedTitle extends StatelessWidget {
  const CustomEnforcedTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(
          title.tr(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        const CustomEnforcedStar(),
      ],
    );
  }
}
