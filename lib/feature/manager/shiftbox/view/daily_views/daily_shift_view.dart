import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_daily_part_container.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_daily_part_title.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_occupancy_widget.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

final class DailyShiftView extends StatefulWidget {
  const DailyShiftView({super.key});

  @override
  State<DailyShiftView> createState() => _DailyShiftViewState();
}

class _DailyShiftViewState extends BaseState<DailyShiftView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const CustomOccupancyWidget(
            mainText: '18-24 Mart Shift List',
            occupancy: '90',
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12).r,
            decoration: BoxDecoration(
              color: ColorName.neutral0,
              borderRadius: ProjectBorderRadius.allCircleMedium(),
            ),
            child: Column(
              children: [
                buildTopText(),
                Container(),
                const CustomDailyPartTitle(
                  startColor: ColorName.blueBase,
                  endColor: ColorName.blueLighter,
                  text: 'SABAH',
                ),
                const CustomDailyPartContainer(
                  hour: '05:00',
                  location: 'Manzara Restaurant',
                  list: ['Guy Hawkins', 'Guy Elrsiterdan'],
                ),
                const CustomDailyPartContainer(
                  hour: '06:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
                const CustomDailyPartContainer(
                  hour: '07:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
                const CustomDailyPartTitle(
                  startColor: ColorName.orangeBase,
                  endColor: ColorName.orangeLighter,
                  text: 'ÖĞLEN',
                ),
                const CustomDailyPartContainer(
                  hour: '11:00',
                  location: 'Manzara Restaurant',
                  list: ['Guy Hawkins', 'Guy Elrsiterdan'],
                ),
                const CustomDailyPartContainer(
                  hour: '12:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
                const CustomDailyPartContainer(
                  hour: '13:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
                const CustomDailyPartTitle(
                  startColor: ColorName.purpleBase,
                  endColor: ColorName.purpleLighter,
                  text: 'AKŞAM',
                ),
                const CustomDailyPartContainer(
                  hour: '17:00',
                  location: 'Manzara Restaurant',
                  list: ['Guy Hawkins', 'Guy Elrsiterdan'],
                ),
                const CustomDailyPartContainer(
                  hour: '18:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
                const CustomDailyPartContainer(
                  hour: '19:00',
                  location: 'Manzara Restaurant',
                  list: [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildTopText() {
    return Row(
      children: [
        Text(
          'Food & Beverage',
          style: textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Assets.icons.icDownArrow.toGetSvg(),
      ],
    );
  }
}
