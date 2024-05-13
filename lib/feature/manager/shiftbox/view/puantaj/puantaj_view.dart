import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/puantaj_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/puantaj_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/puantaj_state.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/empty_list_card.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/constants/const_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import 'package:widgets/widgets.dart';

class PuantajView extends StatefulWidget {
  const PuantajView({super.key});

  @override
  State<PuantajView> createState() => _PuantajViewState();
}

class _PuantajViewState extends BaseState<PuantajView> with PuantajMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider(
        create: (context) => puantajBloc,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12).r,
                child: Container(
                  padding: const EdgeInsets.all(12).r,
                  height: 108.h,
                  decoration: BoxDecoration(
                    color: ColorName.neutral0,
                    borderRadius: ProjectBorderRadius.allCircleNormal(),
                  ),
                  child: buildTopCart(),
                ),
              ),
              BlocBuilder<PuantajBloc, PuantajState>(
                builder: (context, state) => state.isWeakly
                    ? buildWeaklyCalender(state.selectedDate)
                    : buildMouthlyCalender(state.selectedDate),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12).r,
                child: BlocBuilder<PuantajBloc, PuantajState>(
                  builder: (context, state) {
                    return Text(
                      '${DateFormat('d MMMM').format(state.selectedDate)} Puantajı',
                      style: textTheme.titleLarge,
                    );
                  },
                ),
              ),
              BlocBuilder<PuantajBloc, PuantajState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.all(12).r,
                    decoration: BoxDecoration(
                      color: ColorName.neutral0,
                      borderRadius: ProjectBorderRadius.allCircleNormal(),
                    ),

                    /// TODO: Liste gelince burayı liste boşsa haline getir
                    child: state.isWeakly
                        ? EmptyListWarning(
                            textTheme: textTheme,
                            chipText: 'Puantaj bilgisi bulunmamaktadır.',
                            icon: Assets.icons.icEmptyState.toGetSvg(),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) =>
                                buildPersonnelCard(),
                            separatorBuilder: (context, index) => Divider(
                              color: ColorName.neutral300,
                              height: 3.h,
                            ),
                            itemCount: 10,
                          ),
                  );
                },
              ),
              SizedBox(
                height: 24.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildPersonnelCard() {
    return SizedBox(
      height: 56.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                child: Text('AA'),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ellen Rose',
                    style: textTheme.titleMedium,
                  ),
                  Text(
                    '1 Gün',
                    style: textTheme.titleSmall!
                        .copyWith(color: ColorName.neutral500),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '₺17.000.00',
                style: textTheme.titleMedium,
              ),
              Text(
                '0.0 Mesai',
                style:
                    textTheme.titleSmall!.copyWith(color: ColorName.neutral500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildTopCart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildCustomTopChartCard(
          bottomText: '681.123,002',
          icon: Assets.icons.icBarChart.toGetSvgWithColor(
            color: ColorName.blueBase,
          ),
          iconBackGroundColor: ColorName.blueLight,
          middleText: 'Nisan Toplam',
        ),
        VerticalDivider(
          width: 3.w,
          color: ColorName.neutral300,
        ),
        buildCustomTopChartCard(
          bottomText: '423',
          icon: Assets.icons.icUserLine.toGetSvgWithColor(
            color: ColorName.greenBase,
          ),
          iconBackGroundColor: ColorName.greenLight,
          middleText: 'Personnel',
        ),
        VerticalDivider(
          width: 3.w,
          color: ColorName.neutral300,
        ),
        buildCustomTopChartCard(
          bottomText: '1892',
          icon: Assets.icons.icBarChart.toGetSvgWithColor(
            color: ColorName.purpleBase,
          ),
          iconBackGroundColor: ColorName.purpleLight,
          middleText: 'Toplam Saat',
        ),
      ],
    );
  }

  Column buildCustomTopChartCard({
    required Widget icon,
    required Color iconBackGroundColor,
    required String middleText,
    required String bottomText,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: const EdgeInsets.all(6).r,
          height: 32.h,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: iconBackGroundColor),
          child: icon,
        ),
        Text(
          middleText,
          style: textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          bottomText,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }

  Container buildMouthlyCalender(DateTime selectedDate) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 12).r,
      decoration: BoxDecoration(
        color: ColorName.neutral0,
        borderRadius: ProjectBorderRadius.allCircleNormal(),
      ),
      constraints: BoxConstraints(maxHeight: 305.h, minHeight: 100.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildDateHeader(selectedDate),
          Expanded(
            child: SfDateRangePicker(
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              initialSelectedDate: selectedDate,
              initialDisplayDate: selectedDate,
              headerHeight: 0,
              backgroundColor: Colors.transparent,
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: textTheme.titleMedium,
              ),
              controller: dateRangePickerController,
              onSelectionChanged: onSelectionChanged,
            ),
          ),
        ],
      ),
    );
  }

  Column buildDateHeader(DateTime selectedDate) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Assets.icons.icCalendarEventLine
                    .toGetSvgWithColor(color: ColorName.blueBase),
                Text(
                  DateFormat(DATETIME_FORMAT).format(selectedDate),
                  style: textTheme.titleLarge,
                ),
              ],
            ),
            GestureDetector(
              onTap: () => puantajBloc.changeCalenderType(),
              child: Container(
                width: 70.w,
                height: 32.h,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorName.neutral300),
                  borderRadius: ProjectBorderRadius.allCircleNormal(),
                ),
                child: Center(
                  child: Text(
                    puantajBloc.state.isWeakly ? 'Haftalık' : 'Aylık',
                  ),
                ),
              ),
            ),
            Container(
              padding: const ProjectPadding.allSmall(),
              height: 32.h,
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.neutral300),
                borderRadius: ProjectBorderRadius.allCircleNormal(),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      puantajBloc.state.isWeakly
                          ? addWeeak(puantajBloc.state.selectedDate, -1)
                          : addMonth(-1);
                    },
                    child: Assets.icons.icArroeLeftS.toGetSvg(),
                  ),
                  Text(
                    DateFormat('MMMM').format(selectedDate),
                    style: textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {
                      puantajBloc.state.isWeakly
                          ? addWeeak(puantajBloc.state.selectedDate, 1)
                          : addMonth(1);
                    },
                    child: Assets.icons.icArrowRightS.toGetSvg(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Container buildWeaklyCalender(
    DateTime selectedDate,
  ) {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        borderRadius: ProjectBorderRadius.allCircleNormal(),
        color: ColorName.neutral0,
      ),
      child: Column(
        children: [
          buildDateHeader(selectedDate),
          WeeklyDatePicker(
            backgroundColor: ColorName.neutral0,
            weeknumberColor: ColorName.blueBase,
            weekdayText: 'Hafta',
            selectedDigitBackgroundColor: ColorName.blueBase,
            weekdays: const [
              'P',
              'S',
              'Ç',
              'P',
              'C',
              'C',
              'P',
            ],
            selectedDay: selectedDate,
            changeDay: changeWeeaklyDate,
          ),
        ],
      ),
    );
  }
}
