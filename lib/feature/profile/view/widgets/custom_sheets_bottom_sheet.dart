import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_okay_elaviton_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

/// Custom bottom sheet container for manager approval
class CustomSheetsBottomSheet extends StatelessWidget {
  const CustomSheetsBottomSheet({
    required this.text,
    super.key,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          AutoSizeText(
            LocaleKeys.profile_requests_request_permission_information.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const Padding(
            padding: ProjectPadding.symmetricSmallV(),
            child: Divider(
              height: 2,
              color: ColorName.neutral300,
            ),
          ),
          SizedBox(
            height: 300.h,
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                buildCheckCircle(),
                const Spacer(),
                Padding(
                  padding: const ProjectPadding.scaffold(),
                  child: AutoSizeText(
                    textAlign: TextAlign.center,
                    text,
                    maxLines: 4,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
                const CustomOkayElevationButton(
                  text: LocaleKeys.general_button_approve,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack buildCheckCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 88.h,
          width: 88.w,
          padding: const ProjectPadding.allMedium(),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ColorName.neutral200.withOpacity(0.5),
          ),
        ),
        Container(
          height: 56.h,
          width: 56.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorName.greenBase,
          ),
        ),
        Assets.icons.icCheckLine.toGetSvg(),
      ],
    );
  }
}
