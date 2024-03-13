import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';
import 'package:widgets/widgets.dart';

class CustomSolidBottomSheetWithLink extends StatelessWidget {
  const CustomSolidBottomSheetWithLink({
    required this.solidController,
    required this.textEditingController,
    required this.baseTitle,
    required this.subTitle,
    required this.icon,
    required this.route,
    super.key,
  });

  final SolidController solidController;
  final TextEditingController textEditingController;
  final String baseTitle;
  final String subTitle;
  final Widget icon;
  final PageRouteInfo<dynamic> route;

  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
      maxHeight: 490.h,
      autoSwiped: false,
      controller: solidController,
      headerBar: const SizedBox(),
      body: Padding(
        padding: const ProjectPadding.symmetricSmallH(),
        child: Container(
          height: 490.h,
          padding: const ProjectPadding.scaffold(),
          decoration: BoxDecoration(
            color: ColorName.neutral0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ).r,
          ),
          width: context.sized.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: AutoSizeText(
                  LocaleKeys.profile_requests_request_permission_information
                      .tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Divider(
                color: ColorName.neutral200,
              ),
              const Spacer(),
              Padding(
                padding:
                    const ProjectPadding.symmetricMediumV().copyWith(top: 0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 88.h,
                      width: 88.w,
                      padding: const ProjectPadding.allMedium(),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            ColorName.neutral200.withOpacity(0.4),
                            ColorName.neutral0,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorName.neutral200.withOpacity(0.3),
                      ),
                    ),
                    icon,
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  baseTitle.tr(),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  subTitle.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: ColorName.neutral500),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricNormalV(),
                child: TextField(
                  readOnly: true,
                  enableInteractiveSelection: true,
                  controller: textEditingController,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: ColorName.neutral500),
                  onTap: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text: textEditingController.text,
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: textEditingController.text,
                    prefixIcon: Padding(
                      padding: const ProjectPadding.allSmall(),
                      child: Assets.icons.icLink.toGetSvg(),
                    ),
                    suffixIcon: Padding(
                      padding: const ProjectPadding.allSmall(),
                      child: Assets.icons.icCopy.toGetSvg(),
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: ColorName.neutral500),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: ColorName.neutral200,
                      ),
                      borderRadius: ProjectBorderRadius.allCircleNormal(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 56.h,
                width: context.sized.width,
                child: ElevatedButton(
                  onPressed: () {
                    solidController.hide();
                    context.router.pushAndPopUntil(
                      route,
                      predicate: (route) => false,
                    );
                  },
                  child: AutoSizeText(
                    LocaleKeys.general_button_okay.tr(),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorName.neutral0,
                        ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
