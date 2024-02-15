// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluttertoast/fluttertoast.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/home_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_success_toast.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final FToast fToast;
  late final HomeViewModel homeViewModel;
  late final List<WorkShiftModel> workShiftList;
  @override
  void initState() {
    homeViewModel = HomeViewModel();
    fToast = FToast();
    fToast.init(context);
    workShiftList = [
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: ' / 06:45 - 15:05',
        shitTime: ShiftTimeEnum.onTime,
        date: '29',
        currentDay: false,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: ' / 07:45 - 15:05',
        shitTime: ShiftTimeEnum.late,
        date: '30',
        currentDay: false,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: '',
        shitTime: ShiftTimeEnum.empty,
        date: '31',
        currentDay: true,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: '',
        shitTime: ShiftTimeEnum.empty,
        date: '1',
        currentDay: false,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: '',
        shitTime: ShiftTimeEnum.report,
        date: '2',
        currentDay: false,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: '',
        shitTime: ShiftTimeEnum.empty,
        date: '3',
        currentDay: false,
      ),
      WorkShiftModel(
        startEndTime: '07:00 - 15:00',
        workTime: '',
        shitTime: ShiftTimeEnum.empty,
        date: '4',
        currentDay: false,
      ),
    ];
    super.initState();
  }

  /// Show success toast with message on bottom screen
  void showSuccessToast(String message) {
    fToast.showToast(
      child: CustomSuccessToast(
        message: message,
      ),
    );
  }
}

class WorkShiftModel {
  WorkShiftModel({
    required this.startEndTime,
    required this.workTime,
    required this.shitTime,
    required this.date,
    required this.currentDay,
  });

  final String startEndTime;
  final String workTime;
  final ShiftTimeEnum shitTime;
  final String date;
  final bool currentDay;

  WorkShiftModel copyWith({
    String? startEndTime,
    String? workTime,
    ShiftTimeEnum? shitTime,
    String? date,
    bool? currentDay,
  }) {
    return WorkShiftModel(
      startEndTime: startEndTime ?? this.startEndTime,
      workTime: workTime ?? this.workTime,
      shitTime: shitTime ?? this.shitTime,
      date: date ?? this.date,
      currentDay: currentDay ?? this.currentDay,
    );
  }
}
