import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

class CustomOkayElevationButton extends StatelessWidget {
  const CustomOkayElevationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: AutoSizeText(
            LocaleKeys.general_button_okay.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorName.neutral0,
                ),
          ),
        ),
      ),
    );
  }
}
