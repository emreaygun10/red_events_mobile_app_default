// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomAccountOperationItem extends StatelessWidget {
  const CustomAccountOperationItem({
    required this.text,
    required this.labelIcon,
    this.pageRouteInfo,
    super.key,
  });
  final String text;
  final Widget labelIcon;
  final PageRouteInfo<dynamic>? pageRouteInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: GestureDetector(
        onTap: () {
          context.router.push(pageRouteInfo ?? const ProfileRoute());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 42.h,
                  width: 42.w,
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 10,
                    left: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorName.neutral200,
                    ),
                    color: ColorName.neutral100,
                    shape: BoxShape.circle,
                  ),
                  child: labelIcon,
                ),
                Padding(
                  padding: const ProjectPadding.symmetricNormalH(),
                  child: AutoSizeText(
                    text.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: ColorName.neutral900),
                  ),
                ),
              ],
            ),
            Assets.icons.icArrowRightS.svg(
              package: ModuleEnum.gen.value,
              color: ColorName.neutral900,
            ),
          ],
        ),
      ),
    );
  }
}
