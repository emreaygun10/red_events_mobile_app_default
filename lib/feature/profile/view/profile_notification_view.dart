import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_notification_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/profile_notification_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_notification_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/education_chip_enum.dart';
import 'package:widgets/widgets.dart';

part 'widgets/custom_list_tile_notification.dart';

@RoutePage()
class ProfileNotificationView extends StatefulWidget {
  const ProfileNotificationView({super.key});

  @override
  State<ProfileNotificationView> createState() =>
      _ProfileNotificationViewState();
}

class _ProfileNotificationViewState extends BaseState<ProfileNotificationView>
    with ProfileNotificationMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileNotificationBloc,
      child: Scaffold(
        bottomNavigationBar: buildBottomBar(),
        appBar: buildAppBar(),
        body: Column(
          children: [
            CustomProfileHeader(
              columnList: [
                const SizedBox(
                  height: 16,
                ),
                buildTitleText(),
                const Spacer(),
                buildChipList(),
                const Spacer(),
              ],
            ),
            buildListView(),
          ],
        ),
      ),
    );
  }

  BlocBuilder<ProfileNotificationBloc, ProfileNotificationState>
      buildBottomBar() {
    return BlocBuilder<ProfileNotificationBloc, ProfileNotificationState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isLongPress,
          child: Container(
            height: 80.h,
            width: context.sized.width,
            padding: const ProjectPadding.symmetricNormalV(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40.h,
                  width: 161.w,
                  decoration: BoxDecoration(
                    borderRadius: ProjectBorderRadius.allCircleLarge(),
                    border: Border.all(
                      color: ColorName.blueBase,
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.neutral0,
                    ),
                    onPressed: () {
                      profileNotificationBloc
                        ..changeIsLongPress(
                          value: false,
                        )
                        ..giveUpChangeList();
                    },
                    child: AutoSizeText(
                      LocaleKeys.general_button_give_up.tr(),
                      style: textTheme.titleMedium!.copyWith(
                        color: ColorName.blueBase,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 161.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.redBase,
                    ),
                    onPressed: selectedDelete,
                    child: AutoSizeText(
                      LocaleKeys.general_button_delete_selected.tr(),
                      style: textTheme.titleMedium!.copyWith(
                        color: ColorName.neutral0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Expanded buildListView() {
    return Expanded(
      child: BlocBuilder<ProfileNotificationBloc, ProfileNotificationState>(
        builder: (context, state) {
          return state.data != null
              ? ListView.builder(
                  itemCount: state.tempList?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const ProjectPadding.symmetricMediumV()
                          .copyWith(right: 20, left: 20),
                      child: GestureDetector(
                        onLongPress: () => profileNotificationBloc
                            .changeIsLongPress(value: true),
                        onTap: () => context.router.push(
                          ProfileRequestDetailRoute(
                            permissionColor: ColorName.orangeLight,
                            iconColor: ColorName.orangeBase,
                          ),
                        ),
                        child: buildCustomListTile(index, state),
                        // child: CustomListTileNotification(
                        //   textTheme: textTheme,
                        //   dataModel: state.data![index],
                        //   isVisible: state.isLongPress,
                        //   profileNotificationBloc: profileNotificationBloc,
                        // ),
                      ),
                    );
                  },
                )
              : const CircularProgressIndicator();
        },
      ),
    );
  }

  Container buildCustomListTile(
    int index,
    ProfileNotificationState state,
  ) {
    return Container(
      height: 56.h,
      width: context.sized.width,
      padding: const ProjectPadding.allSmall(),
      decoration: BoxDecoration(
        color: state.tempList![index].isCheck
            ? ColorName.blueLight
            : state.isLongPress
                ? ColorName.neutral0
                : state.tempList![index].isRead
                    ? ColorName.neutral0
                    : ColorName.orangeLight,
        borderRadius: ProjectBorderRadius.allCircleMedium(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Visibility(
                visible: state.isLongPress,
                child: Checkbox(
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 2,
                      color: ColorName.neutral300,
                    ),
                  ),
                  activeColor: ColorName.blueBase,
                  value: state.tempList![index].isCheck,
                  onChanged: (value) => changeModelInList(
                    model: state.tempList![index],
                    value: value ?? false,
                  )
                  // setState(() {});
                  ,
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: state.tempList![index].isRead
                        ? ColorName.neutral300
                        : ColorName.orangeLight,
                  ),
                  shape: BoxShape.circle,
                  color: state.tempList![index].isRead
                      ? ColorName.neutral100
                      : ColorName.orangeBase,
                ),
                child: Assets.icons.icCloseCircle.toGetSvgWithColor(
                  color: state.tempList![index].isRead
                      ? ColorName.neutral300
                      : ColorName.neutral0,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              Padding(
                padding: const ProjectPadding.symmetricMediumH(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        state.tempList![index].title.tr(),
                        style: textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: AutoSizeText(
                        state.tempList![index].subTitle.tr(),
                        style: textTheme.titleSmall!.copyWith(
                          color: ColorName.neutral400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: !state.tempList![index].isRead,
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                color: ColorName.orangeBase,
                border: Border.all(
                  color: ColorName.neutral0,
                  width: 5,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorName.neutral0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: const ProjectPadding.scaffold(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            height: 24.h,
            width: 24.w,
            padding: const ProjectPadding.allSmall(),
            decoration: const BoxDecoration(
              color: ColorName.neutral200,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: TextButton(
            onPressed: () {},
            child: AutoSizeText(
              LocaleKeys.profile_notifications_clear.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorName.neutral400),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildChipList() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 32.h,
        child: BlocBuilder<ProfileNotificationBloc, ProfileNotificationState>(
          builder: (context, state) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: NotificationChips.values.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const ProjectPadding.symmetricXSmallH(),
                  child: buildChip(state, index, profileNotificationBloc),
                );
              },
            );
          },
        ),
      ),
    );
  }

  GestureDetector buildChip(
    ProfileNotificationState state,
    int index,
    ProfileNotificationBloc profileNotificationsBloc,
  ) {
    return GestureDetector(
      onTap: () => assignTempList(index),
      child: Container(
        padding: const ProjectPadding.customChipPaddingLarge(),
        height: 32.h,
        width: 106.w,
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          color: state.chipIndex == index
              ? ColorName.blueBase
              : ColorName.neutral200,
        ),
        child: Center(
          child: AutoSizeText(
            NotificationChips.values[index].value.tr(),
          ),
        ),
      ),
    );
  }

  Padding buildTitleText() {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        LocaleKeys.profile_notifications_title.tr(),
        style: textTheme.headlineMedium!.copyWith(
          color: ColorName.neutral900,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
