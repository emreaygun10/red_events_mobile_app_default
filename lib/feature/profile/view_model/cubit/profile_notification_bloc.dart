import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_notification_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Notification state management class
class ProfileNotificationBloc extends BaseCubit<ProfileNotificationState> {
  ///
  ProfileNotificationBloc()
      : super(
          const ProfileNotificationState(
            isLoading: false,
            chipIndex: 0,
            isLongPress: false,
          ),
        );

  /// change value obscure
  void changeChipIndex(int index) {
    emit(state.copyWith(chipIndex: index));
  }

  ///change response data
  void changeList(List<DataModel> data) {
    emit(state.copyWith(data: data));
  }

  /// change long press
  void changeIsLongPress({required bool value}) {
    emit(state.copyWith(isLongPress: value));
  }

  void giveUpChangeList() {
    final tempList = state.data!;

    for (var x = 0; x < tempList.length; x++) {
      tempList[x] = tempList[x].copyWith(isCheck: false);
    }
    emit(state.copyWith(data: tempList));
  }

  void changeModelInList({required DataModel model, required bool value}) {
    final index =
        state.data!.indexWhere((element) => element.title == model.title);
    final tempList = state.data!;
    tempList[index] = state.data![index].copyWith(isCheck: value);
    emit(state.copyWith(data: tempList));
  }

  void selectedElementDelete() {
    final tempList =
        state.data!.where((element) => element.isCheck != true).toList();

    emit(state.copyWith(data: tempList));
  }
}
