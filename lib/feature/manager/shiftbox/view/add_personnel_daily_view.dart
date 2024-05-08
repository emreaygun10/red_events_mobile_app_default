import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/add_personnel_daily_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/add_personnel_daily_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/model/daily_personnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/add_peronnel_daily_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class AddPersonnelDailyView extends StatefulWidget {
  const AddPersonnelDailyView({super.key});

  @override
  State<AddPersonnelDailyView> createState() => _AddPersonnelDailyViewState();
}

class _AddPersonnelDailyViewState extends BaseState<AddPersonnelDailyView>
    with AddPersonnelDailyMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.neutral0,
      appBar: AppBar(
        title: const Text('Personel Ekle'),
        backgroundColor: ColorName.neutral0,
        surfaceTintColor: ColorName.neutral0,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: BlocProvider(
          create: (context) => addPersonnelDailyBloc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 12.h,
              ),
              buildTopChipsRow(context),
              const Padding(
                padding: ProjectPadding.symmetricMediumV(),
                child: Divider(),
              ),
              BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
                builder: (context, state) {
                  return buildTitle(
                    counter: state.addedPersonnelList.ext.isNotNullOrEmpty
                        ? state.addedPersonnelList!.length
                        : 0,
                    title: 'Eklenenler',
                  );
                },
              ),
              BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
                builder: (context, state) {
                  return Flexible(
                    flex: state.addedPersonnelList.ext.isNotNullOrEmpty
                        ? state.addedPersonnelList!.length
                        : 1,
                    child: Container(
                      padding: const ProjectPadding.scaffold(),
                      child: state.addedPersonnelList.ext.isNotNullOrEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) => buildUserCard(
                                personnelModel:
                                    state.addedPersonnelList![index],
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 8.h,
                              ),
                              itemCount: state.addedPersonnelList!.length,
                            )
                          : buildEmptyUser(),
                    ),
                  );
                },
              ),
              BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
                builder: (context, state) {
                  return buildTitle(
                    counter: state.personnelList.ext.isNotNullOrEmpty
                        ? state.personnelList!.length
                        : 0,
                    title: 'Kişiler',
                  );
                },
              ),
              BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
                builder: (context, state) {
                  return state.personnelList.ext.isNotNullOrEmpty
                      ? Flexible(
                          flex: state.personnelList.ext.isNotNullOrEmpty
                              ? state.personnelList!.length
                              : 1,
                          child: Padding(
                            padding: const ProjectPadding.scaffold(),
                            child: ListView.separated(
                              itemBuilder: (context, index) => buildUserCard(
                                personnelModel: state.personnelList![index],
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 8.h,
                              ),
                              itemCount: state.personnelList!.length,
                            ),
                          ),
                        )
                      : buildEmptyUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildUserCard({required DailyPersonnelModel personnelModel}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).r,
      height: 70.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral300),
        borderRadius: ProjectBorderRadius.allCircleNormal(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 48.h,
                width: 40.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4).r,
                        height: 16.h,
                        decoration: const ShapeDecoration(
                          color: ColorName.neutral100,
                          shape: StadiumBorder(),
                        ),
                        child: Text(personnelModel.age.toString()),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${personnelModel.name} ${personnelModel.surname}',
                    style: textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      buildUserSpecialChip(personnelModel.title),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ).r,
                        child: buildUserSpecialChip(personnelModel.job),
                      ),
                      Assets.icons.icWhatsApp.toGetSvg(),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 24.h,
            decoration: const BoxDecoration(
              color: ColorName.blueBase,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              onTap: () => personnelModel.isAdded
                  ? removePersonnel(personnelModel)
                  : addPersonnel(personnelModel),
              child: BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
                builder: (context, state) {
                  return Icon(
                    personnelModel.isAdded ? Icons.remove : Icons.add,
                    color: ColorName.neutral0,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildUserSpecialChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8).r,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(color: ColorName.neutral300),
        ),
      ),
      child: Text(text),
    );
  }

  Container buildEmptyUser() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.neutral300),
        borderRadius: ProjectBorderRadius.allCircleNormal(),
      ),
      height: 64.h,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(
              10,
            ).r,
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorName.neutral400),
            ),
            child: Assets.icons.icUser2.toGetSvg(),
          ),
          SizedBox(
            width: 8.h,
          ),
          Text(
            'Ekli Kişi Yok',
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Padding buildTitle({required String title, required int counter}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24).r,
      child: Text(
        '$title ($counter)',
        style: textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Padding buildTopChipsRow(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 42.h,
        width: context.sized.width,
        child: BlocBuilder<AddPersonnelDailyBloc, AddPersonnelDailyState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCustomChip(
                  text: 'Atanamayan',
                  chipColor: ColorName.orangeLight,
                  chipValue: 0,
                  counter: '8',
                  selected: state.selectedChip == 0,
                ),
                buildCustomChip(
                  text: 'Tümü',
                  chipColor: ColorName.orangeLight,
                  chipValue: 1,
                  counter: '3',
                  selected: state.selectedChip == 1,
                ),
                buildCustomChip(
                  text: 'İzinli & Raporlular',
                  chipColor: ColorName.orangeLight,
                  chipValue: 2,
                  counter: '8',
                  selected: state.selectedChip == 2,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  GestureDetector buildCustomChip({
    required String text,
    required Color chipColor,
    required String counter,
    required int chipValue,
    bool selected = false,
  }) {
    return GestureDetector(
      onTap: () => addPersonnelDailyBloc.changeSelectedChip(chipValue),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ).r,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4C7A96) : ColorName.neutral200,
          borderRadius: ProjectBorderRadius.allCircleMedium(),
          border: Border.all(
            color: ColorName.neutral200,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              width: 4.w,
            ),
            Container(
              height: 15.h,
              width: 15.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: chipColor,
              ),
              child: Center(child: AutoSizeText(counter)),
            ),
          ],
        ),
      ),
    );
  }
}
