import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_okay_elaviton_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

class CustomSuccessModelBottomSheetContent extends StatelessWidget {
  const CustomSuccessModelBottomSheetContent({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            AutoSizeText(
              LocaleKeys.profile_requests_request_permission_information.tr(),
            ),
            const Padding(
              padding: ProjectPadding.symmetricSmallV(),
              child: Divider(
                height: 2,
                color: ColorName.neutral300,
              ),
            ),
            SizedBox(
              height: 250.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 88.h,
                        width: 88.w,
                        padding: const ProjectPadding.allMedium(),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.neutral200,
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
                  ),
                  const Spacer(),
                  AutoSizeText(
                    text,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                  const CustomOkayElevationButton(),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
