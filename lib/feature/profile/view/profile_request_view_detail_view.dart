import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestDetailView extends StatelessWidget {
  const ProfileRequestDetailView({
    required this.permissionColor,
    required this.iconColor,
    super.key,
  });
  final Color permissionColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          SizedBox(
            height: 545.h,
            width: context.sized.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 335.w,
                    height: 513.h,
                    decoration: BoxDecoration(
                      color: ColorName.neutral100,
                      border: Border.all(color: ColorName.neutral200, width: 2),
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Column(
                      children: [
                        buildHeaderCard(context),
                        buildTextLabel(
                          context,
                          LocaleKeys.profile_requests_detail_page_detail_label,
                        ),
                        buildCenterCard(),
                        buildTextLabel(
                          context,
                          LocaleKeys
                              .profile_requests_detail_page_station_request_label,
                        ),
                        bottomCard(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const ProjectPadding.allSmall(),
                    height: 64.h,
                    width: 64.w,
                    decoration: BoxDecoration(
                      color: permissionColor,
                      shape: BoxShape.circle,
                    ),
                    child: Assets.icons.icCalendar
                        .toGetSvgWithColor(color: iconColor),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          buildButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  Padding buildButton(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: GestureDetector(
        onTap: () {
          print('Tıklandı');
        },
        child: Container(
          height: 56.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.blueBase),
            borderRadius: ProjectBorderRadius.allCircleLarge(),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.icDeleteBin.toGetSvg(),
              AutoSizeText(
                'Talebi Sil',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: ColorName.blueBase),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCenterCard() {
    return Container(
      width: 335.w,
      height: 164.h,
      color: ColorName.neutral0,
      padding: const ProjectPadding.allMedium(),
      child: Column(
        children: [
          buildCustomRow(
            LocaleKeys.profile_requests_detail_page_permission_type,
            const AutoSizeText('Yıllık İzin'),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: buildCustomRow(
              LocaleKeys.profile_requests_detail_page_permission_date,
              const AutoSizeText('08 - 12 Şubat 2023'),
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV().copyWith(top: 0),
            child: buildCustomRow(
              LocaleKeys.profile_requests_detail_page_sum_day,
              const AutoSizeText('5 gün'),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.icons.icStickyNoteLine.svg(
                  package: ModuleEnum.gen.value,
                  height: 20.h,
                ),
                const Expanded(
                  child: AutoSizeText(
                    'Sed ut perspiciatis unde omnis iste natus error sit ar voluptatem accusantium amet.',
                    maxLines: 3,
                    style: TextStyle(color: ColorName.neutral400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container bottomCard() {
    return Container(
      width: 335.w,
      height: 164.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(20).r,
          bottomRight: const Radius.circular(20).r,
        ),
        color: ColorName.neutral0,
      ),
      padding: const ProjectPadding.allMedium(),
      child: Column(
        children: [
          buildCustomRow(
            LocaleKeys.profile_requests_detail_page_station,
            SizedBox(
              height: 20.h,
              child: Badge(
                label: const Text('Reddedildi'),
                padding: const ProjectPadding.symmetricSmallH().r,
                backgroundColor: permissionColor,
              ),
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV(),
            child: buildCustomRow(
              LocaleKeys.profile_requests_detail_page_approving,
              const AutoSizeText('Ersin İşlev'),
            ),
          ),
          Padding(
            padding: const ProjectPadding.symmetricSmallV().copyWith(top: 0),
            child: buildCustomRow(
              LocaleKeys.profile_requests_detail_page_reason_for_rejection,
              const AutoSizeText('İzin Aşımı'),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Assets.icons.icStickyNoteLine.svg(
                  package: ModuleEnum.gen.value,
                  height: 20.h,
                ),
                const Expanded(
                  child: AutoSizeText(
                    'Sed ut perspiciatis unde omnis iste natus error sit ar voluptatem accusantium amet.',
                    style: TextStyle(color: ColorName.neutral400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildCustomRow(String leading, Widget postfix) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          leading.tr(),
          style: const TextStyle(color: ColorName.neutral400),
        ),
        postfix,
      ],
    );
  }

  Padding buildTextLabel(BuildContext context, String text) {
    return Padding(
      padding: const ProjectPadding.symmetricNormalH(),
      child: Container(
        height: 40,
        padding: const ProjectPadding.symmetricNormalV()
            .copyWith(top: 8, bottom: 8)
            .r,
        child: Row(
          children: [
            AutoSizeText(
              text.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: ColorName.neutral400),
            ),
          ],
        ),
      ),
    );
  }

  Container buildHeaderCard(BuildContext context) {
    return Container(
      height: 104.h,
      width: 335.w,
      padding: const ProjectPadding.allMedium().copyWith(top: 40).r,
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ).r,
      ),
      child: Column(
        children: [
          AutoSizeText(
            LocaleKeys.profile_requests_request_type_request_to_permission.tr(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          AutoSizeText(
            '08.01.2024 - 17:34',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorName.neutral500),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: AutoSizeText(
        LocaleKeys.profile_requests_detail_page_title.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
