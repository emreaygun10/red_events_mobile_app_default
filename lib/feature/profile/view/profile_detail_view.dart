import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileDetailView extends StatelessWidget {
  const ProfileDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const ProjectPadding.symmetricLargeV(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopProfileCard(context),
              buildTitle(
                context,
                LocaleKeys.profile_profile_detail_personel_info,
              ),
              Padding(
                padding: const ProjectPadding.scaffold(),
                child: Container(
                  padding: const ProjectPadding.allSmall(),
                  decoration: BoxDecoration(
                    color: ColorName.neutral0,
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: buildPersonnelInfoCard(context),
                ),
              ),
              buildTitle(context, LocaleKeys.profile_work_info_title),
              buildWorkInfoCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildWorkInfoCard(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        padding: const ProjectPadding.allSmall(),
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: Column(
          children: [
            buildListTile(
              context,
              icon: Assets.icons.icSuitcaseLine.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_departmanent,
            ),
            buildListTile(
              context,
              icon: Assets.icons.icBuilding.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_Type,
            ),
            buildListTile(
              context,
              icon: Assets.icons.icUser2.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_mission,
            ),
            buildListTile(
              context,
              icon: Assets.icons.icTime.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_work_type,
            ),
            buildListTile(
              context,
              icon: Assets.icons.icCalendarEvent.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_started_date,
            ),
            buildListTile(
              context,
              icon: Assets.icons.icStar.toGetSvg(),
              desc: '24',
              title: LocaleKeys.profile_work_info_performance,
              showDivider: false,
            ),
          ],
        ),
      ),
    );
  }

  Column buildPersonnelInfoCard(BuildContext context) {
    return Column(
      children: [
        buildListTile(
          context,
          icon: Assets.icons.icAge.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_age,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icIdentity.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_tc,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icAddress.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_address,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icMail.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_mail,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icCellphone.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_phone_number,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icHeartPulse.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_bload_type,
        ),
        buildListTile(
          context,
          icon: Assets.icons.icContactsBook.toGetSvg(),
          desc: '24',
          title: LocaleKeys.profile_profile_detail_emergy_sitation,
          showDivider: false,
        ),
      ],
    );
  }

  Column buildListTile(
    BuildContext context, {
    required Widget icon,
    required String title,
    required String desc,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: const ProjectPadding.symmetricXSmallV(),
          child: SizedBox(
            height: 28.h,
            width: context.sized.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    icon,
                    Padding(
                      padding: const ProjectPadding.symmetricSmallH(),
                      child: AutoSizeText(
                        title.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorName.neutral400),
                      ),
                    ),
                  ],
                ),
                AutoSizeText(desc),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 2,
            color: ColorName.neutral200,
          ),
      ],
    );
  }

  /// Bottom Card Title
  Padding buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const ProjectPadding.scaffold().copyWith(top: 16, bottom: 16).r,
      child: AutoSizeText(
        title.tr(),
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: ColorName.neutral400),
      ),
    );
  }

  Padding buildTopProfileCard(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 136,
        width: context.sized.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 104.h,
                width: context.sized.width,
                decoration: BoxDecoration(
                  color: ColorName.neutral0,
                  borderRadius: ProjectBorderRadius.allCircleMedium(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizeText(
                      'Burak Yılmaz Güven, 35',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16).r,
                      child: AutoSizeText(
                        'Garson',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorName.neutral400),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 64.h,
                width: 64.w,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50',
                  ),
                  //NetworkImage('https://via.placeholder.com/64x64'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorName.neutral100,
      centerTitle: true,
      leading: Padding(
        padding: const ProjectPadding.allSmall(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Assets.icons.icArroeLeftS.toGetSvg(),
        ),
      ),
      title: AutoSizeText(
        LocaleKeys.profile_profile_detail_title.tr(),
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
