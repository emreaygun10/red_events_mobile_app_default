import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/mixin/add_personnel_list_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_bottom_button.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/add_personnel_list_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/state/add_personnel_list_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_personnel_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddPersonnelListView extends StatefulWidget {
  const AddPersonnelListView({super.key});

  @override
  State<AddPersonnelListView> createState() => _AddPersonnelListViewState();
}

class _AddPersonnelListViewState extends BaseState<AddPersonnelListView>
    with AddPersonnelListMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addPersonnelListBloc,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: Column(
          children: [
            const CustomPersonnelTopStack(
              linearProgressEnum: LinearProgressEnum.levelFiveInFive,
              text: LocaleKeys.setup_personnel_title,
              maxLevel: '5',
            ),
            Flexible(
              flex: 6,
              child: BlocBuilder<AddPersonnelListBloc, AddPersonnelListState>(
                builder: (context, state) {
                  return ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.zero,
                    itemCount: state.personnelList.length + 1,
                    itemBuilder: (context, index) {
                      return state.personnelList.isEmpty
                          ? buildDottedBorderCard(context)
                          : index == state.personnelList.length
                              ? buildPersonnelCard(context, index)
                              : buildDottedBorderCard(context);
                    },
                  );
                },
              ),
            ),
            Flexible(
              child: BlocConsumer<AddPersonnelListBloc, AddPersonnelListState>(
                listener: (context, state) {
                  if (state.personnelList.isNotEmpty) {
                    addPersonnelListBloc.changeIsDisable(value: false);
                  } else {
                    addPersonnelListBloc.changeIsDisable(value: true);
                  }
                },
                builder: (context, state) {
                  return CustomBottomButton(
                    backgroundColor: state.isDisable
                        ? ColorName.neutral200
                        : ColorName.blueBase,
                    textColor: state.isDisable
                        ? ColorName.neutral400
                        : ColorName.neutral0,
                    textTheme: textTheme,
                    route: const AddDepartmentFormRoute(),
                    isDisable: state.isDisable,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<AddPersonnelListBloc, AddPersonnelListState> buildPersonnelCard(
    BuildContext context,
    int index,
  ) {
    return BlocBuilder<AddPersonnelListBloc, AddPersonnelListState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            top: 12,
            bottom: 16.h,
            right: 12,
            left: 12,
          ).r,
          height: 96.h,
          width: context.sized.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorName.neutral200,
            ),
            borderRadius: ProjectBorderRadius.allCircleMedium(),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 48.h,
                width: 48.w,
                child: Stack(
                  children: [
                    Align(
                      child: Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.orangeLight,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Chip(
                        label: AutoSizeText('24'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText(
                      state.personnelList[index].nameSurname,
                      style: textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    AutoSizeText(
                      state.personnelList[index].department,
                      style: textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral500,
                      ),
                    ),
                    Row(
                      children: [
                        AutoSizeText(
                          state.personnelList[index].phoneNumber,
                          style: textTheme.titleSmall!.copyWith(
                            color: ColorName.neutral500,
                          ),
                        ),
                        Assets.icons.icDot.toGetSvg(),
                        AutoSizeText(
                          state.personnelList[index].mail,
                          style: textTheme.titleSmall!.copyWith(
                            color: ColorName.neutral500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Assets.icons.icEditLine.toGetSvg(),
            ],
          ),
        );
      },
    );
  }

  Padding buildDottedBorderCard(
    BuildContext context,
  ) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: BlocBuilder<AddPersonnelListBloc, AddPersonnelListState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () async {
              final personnel = await context.router
                  .push<PersonnelModel>(const AddPersonnelFormRoute());
              if (personnel != null) {
                personnelList.add(personnel);
                addPersonnelListBloc.changeModelList(personnelList);
              }
            },
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(16),
              dashPattern: const [10, 5, 10, 5],
              strokeCap: StrokeCap.round,
              color: ColorName.neutral300,
              child: SizedBox(
                width: context.sized.width,
                height: 120.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      padding: const ProjectPadding.allSmall(),
                      decoration: const BoxDecoration(
                        color: ColorName.neutral300,
                        shape: BoxShape.circle,
                      ),
                      child: Assets.icons.icAdd.toGetSvg(),
                    ),
                    const AutoSizeText('Personel Ekle'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Container(
        height: 40.h,
        width: 40.w,
        padding: const ProjectPadding.allXSmall(),
        child: Assets.icons.icLogoDark.toGetSvg(),
      ),
      actions: [
        Padding(
          padding: const ProjectPadding.scaffold(),
          child: Container(
            decoration: BoxDecoration(
              color: ColorName.neutral100.withOpacity(0.7),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            height: 30.h,
            width: 30.w,
            child: Assets.icons.icClose
                .toGetSvgWithColor(color: ColorName.blueBase),
          ),
        ),
      ],
    );
  }
}
