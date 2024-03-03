import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20).r,
      child: Row(
        children: [
          const Flexible(
            flex: 4,
            child: Divider(
              color: ColorName.neutral200,
            ),
          ),
          const Spacer(),
          AutoSizeText(
            title.tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorName.neutral400),
          ),
          const Spacer(),
          const Flexible(
            flex: 4,
            child: Divider(
              height: 8,
              color: ColorName.neutral200,
            ),
          ),
        ],
      ),
    );
  }
}
