import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/mixin/hr_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_personnel_card_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_solid_bottom_sheet_with_link.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/hr_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/hr_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:widgets/widgets.dart';

part 'widget/hr_appbar.dart';

@RoutePage()
class HrView extends StatefulWidget {
  const HrView({
    super.key,
    this.isEditMode = false,
    this.groupValue = 0,
    this.personnelList = const [],
  });

  final bool isEditMode;
  final int groupValue;
  final List<PersonnelModel> personnelList;

  @override
  State<HrView> createState() => _HrViewState();
}

class _HrViewState extends BaseState<HrView> with HrMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => hrBloc,
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        appBar: HrAppBarWidget(
          hrBloc: hrBloc,
        ),
        body: Column(
          children: [
            buildFilterColumn(),
            buildSecondFilterRow(),
            buildList(),
            buildBottomNavigationBar(),
          ],
        ),
      ),
    );
  }

  CustomSolidBottomSheetWithLink buildBottomSheet() {
    return CustomSolidBottomSheetWithLink(
      baseTitle: widget.groupValue == HrBottomSheetEnum.pushGBT.index
          ? LocaleKeys.manager_bottom_sheet_push_gbt_sheet_title
          : LocaleKeys.manager_bottom_sheet_donwload_excel_sheet_title,
      subTitle: widget.groupValue == HrBottomSheetEnum.pushGBT.index
          ? LocaleKeys.manager_bottom_sheet_push_gbt_sheet_sub_title
          : LocaleKeys.manager_bottom_sheet_donwload_excel_sheet_sub_title,
      icon: widget.groupValue == HrBottomSheetEnum.pushGBT.index
          ? Assets.icons.icLink.toGetSvg()
          : Assets.icons.icExcel.toGetSvg(),
      solidController: solidController,
      textEditingController: textEditingController,
      route: HrRoute(),
    );
  }

  Expanded buildList() {
    return Expanded(
      child: Padding(
        padding: const ProjectPadding.scaffold(),
        child: BlocBuilder<HrBloc, HrState>(
          builder: (context, state) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return index == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const ProjectPadding.symmetricNormalV(),
                            child: AutoSizeText(
                              LocaleKeys.manager_hr_search_all_personnel.tr(
                                args: [
                                  state.personnelList.length.toString(),
                                ],
                              ),
                              style: textTheme.titleLarge!.copyWith(
                                color: ColorName.neutral700,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          CustomPersonnelCardWidget(
                            isEditMode: state.isEditMode,
                            personnelModel: state.personnelList[index],
                            hrBloc: hrBloc,
                          ),
                        ],
                      )
                    : CustomPersonnelCardWidget(
                        isEditMode: state.isEditMode,
                        personnelModel: state.personnelList[index],
                        hrBloc: hrBloc,
                      );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 5.h,
                );
              },
              itemCount: state.personnelList.length,
            );
          },
        ),
      ),
    );
  }

  BlocBuilder<HrBloc, HrState> buildBottomNavigationBar() {
    return BlocBuilder<HrBloc, HrState>(
      builder: (context, state) {
        return state.isEditMode
            ? Container(
                height: 96.h,
                width: context.sized.width,
                padding:
                    const ProjectPadding.allMedium().copyWith(bottom: 30).r,
                child: ElevatedButton(
                  onPressed: () {
                    if (state.buttonCounter > 0) {
                      if (widget.groupValue ==
                              HrBottomSheetEnum.pushFile.index ||
                          widget.groupValue ==
                              HrBottomSheetEnum.pushNotification.index) {
                        context.router.push(
                          selectBottomButtonRoute(
                            HrBottomSheetEnum.values[widget.groupValue],
                          )!,
                        );
                      } else if (widget.groupValue ==
                          HrBottomSheetEnum.pushGBT.index) {
                        print('gbt');
                        solidController.show();
                      } else if (widget.groupValue ==
                          HrBottomSheetEnum.downloadExcel.index) {
                        print('excel');
                        solidController.show();
                      }
                    }
                  },
                  child: AutoSizeText(
                    selectBottomButtonText(
                      HrBottomSheetEnum.values[widget.groupValue],
                    ),
                    style: textTheme.titleMedium!
                        .copyWith(color: ColorName.neutral0),
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }

  Container buildSecondFilterRow() {
    return Container(
      padding: const ProjectPadding.scaffold(),
      height: 52.h,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: ColorName.neutral200,
          ),
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) => Center(
          child: AutoSizeText(
            '800 Çalışan',
            style: textTheme.titleSmall!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 9.w,
        ),
      ),
    );
  }

  Container buildFilterColumn() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      height: 52.h,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: ColorName.neutral200,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildRowItem(
            widget: Assets.icons.icFilter.toGetSvg(),
            isVisibleDownArrow: false,
          ),
          buildRowItem(text: 'Departman'),
          buildRowItem(text: 'Bölüm'),
          buildRowItem(text: 'Görev'),
        ],
      ),
    );
  }

  Container buildRowItem({
    String text = '',
    Widget? widget,
    bool isVisibleDownArrow = true,
  }) {
    return Container(
      height: 32.h,
      padding: const ProjectPadding.allSmall(),
      decoration: BoxDecoration(
        borderRadius: ProjectBorderRadius.allCircleMedium(),
        color: ColorName.neutral200,
      ),
      child: Row(
        children: [
          widget ??
              AutoSizeText(
                text.tr(),
                style: textTheme.titleSmall,
              ),
          SizedBox(
            width: 8.w,
          ),
          Visibility(
            visible: isVisibleDownArrow,
            child: Assets.icons.icDownArrow.toGetSvg(),
          ),
        ],
      ),
    );
  }
}
