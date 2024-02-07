import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

class CustomSheetBottomNavigationBar extends StatelessWidget {
  const CustomSheetBottomNavigationBar({
    required this.textTheme,
    required this.text,
    required this.amount,
    super.key,
  });

  final TextTheme textTheme;
  final String text;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  text,
                  style: textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                AutoSizeText(
                  amount,
                  style: textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
              width: context.sized.width,
              child: ElevatedButton(
                onPressed: () {
                  context.router.pop();
                },
                child: AutoSizeText(
                  LocaleKeys.general_button_okay.tr(),
                  style:
                      textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
