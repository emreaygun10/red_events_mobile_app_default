import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/weakly_shift_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_occupancy_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_weakly_item.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/weakly_shift_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/weakly_sihft_state.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class WeaklyShiftView extends StatefulWidget {
  const WeaklyShiftView({super.key});

  @override
  State<WeaklyShiftView> createState() => _WeaklyShiftViewState();
}

class _WeaklyShiftViewState extends BaseState<WeaklyShiftView>
    with WeaklyShiftMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => weaklyShiftBloc,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildEmpty(12),
              const CustomOccupancyWidget(
                mainText: '18-24 Mart Shift List',
                occupancy: '90',
              ),
              buildEmpty(15),
              AutoSizeText(
                'Auto & Food',
                style: textTheme.labelLarge!.copyWith(
                  color: ColorName.neutral900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              buildEmpty(8),
              buildPlaceList(context),
              buildEmployeerList(),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildEmployeerList() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 12).r,
      itemBuilder: (context, index) => SizedBox(
        height: 132.h,
        child: buildEmployeerListColumn(context),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 12.h,
      ),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
    );
  }

  Column buildEmployeerListColumn(BuildContext context) {
    return Column(
      children: [
        buildEmployeerListTopContainer(context),
        buildEmployeerListBottomContainer(context),
      ],
    );
  }

  Container buildEmployeerListBottomContainer(BuildContext context) {
    return Container(
      padding: const ProjectPadding.symmetricSmallH(),
      height: 76.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        border: Border.all(color: ColorName.neutral200, width: 2),
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(20).r,
          bottomRight: const Radius.circular(20).r,
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => const CustomWeaklyItem(
          day: 'CM',
          hour: '17.00',
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 12.w,
        ),
        itemCount: 7,
      ),
    );
  }

  Container buildEmployeerListTopContainer(BuildContext context) {
    return Container(
      height: 56.h,
      width: context.sized.width,
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        border: Border.all(color: ColorName.neutral200, width: 2),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20).r,
          topRight: const Radius.circular(20).r,
        ),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: ColorName.pinkLight,
          child: AutoSizeText('AA'),
        ),
        title: AutoSizeText(
          'Aydanur Aygün',
          style: textTheme.titleMedium,
        ),
        trailing: IconButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              enableDrag: false,
              builder: (context) => SizedBox(
                height: 250.h,
                width: context.sized.width,
                child: Padding(
                  padding: const ProjectPadding.scaffold(),
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.transparent,
                        title: Text(
                          'Personel İşlemleri',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        leading: Padding(
                          padding: const ProjectPadding.allSmall(),
                          child: GestureDetector(
                            onTap: () => context.router.pop(),
                            child: const CircleAvatar(
                              backgroundColor: ColorName.neutral200,
                              child: Icon(Icons.close),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            buildListTileColumn(
                              icon: Assets.icons.icCalendar.toGetSvgWithColor(
                                color: ColorName.neutral900,
                                height: 20.h,
                              ),
                              text: 'Haftalık Shift Detayı',
                              onTap: () => context.router
                                  .push(const WeaklyShiftDetailRoute()),
                            ),
                            buildListTileColumn(
                              icon: Assets.icons.icMailSend.toGetSvgWithColor(
                                color: ColorName.neutral900,
                                height: 20.h,
                              ),
                              text: 'Personele shiftlerini gönder',
                              onTap: () => context.router.pop(),
                            ),
                            buildListTileColumn(
                              icon: Assets.icons.icUserShared.toGetSvgWithColor(
                                color: ColorName.neutral900,
                                height: 20.h,
                              ),
                              text: 'Kişi detayına git',
                              onTap: () => context.router.pop(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          icon: Assets.icons.icMore.toGetSvg(),
        ),
      ),
    );
  }

  Column buildListTileColumn({
    required String text,
    required Widget icon,
    required void Function() onTap,
  }) {
    return Column(
      children: [
        const Divider(
          color: ColorName.neutral200,
          height: 2,
        ),
        buildListTile(
          text: text,
          icon: icon,
          onTap: onTap,
        ),
      ],
    );
  }

  ListTile buildListTile({
    required String text,
    required Widget icon,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: icon,
      onTap: onTap,
      title: Text(
        text,
        style: textTheme.titleLarge!.copyWith(
          color: ColorName.neutral900,
        ),
      ),
    );
  }

  SizedBox buildPlaceList(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: context.sized.width,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            BlocBuilder<WeaklyShiftBloc, WeaklyShiftState>(
          builder: (context, state) {
            return ActionChip(
              backgroundColor: index == state.selectedChip
                  ? ColorName.neutral500
                  : ColorName.neutral0,
              shape: const StadiumBorder(),
              onPressed: () {
                weaklyShiftBloc.changeChip(index);
              },
              side: const BorderSide(color: ColorName.neutral300),
              labelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: ColorName.neutral900),
              label: const AutoSizeText(
                'Lobi Bar (10/0)',
              ),
            );
          },
        ),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
      ),
    );
  }

  SizedBox buildEmpty(int height) {
    return SizedBox(
      height: height.h,
    );
  }
}
