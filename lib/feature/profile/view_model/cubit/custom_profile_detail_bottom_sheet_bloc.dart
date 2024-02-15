import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/custom_profile_detail_bottom_sheet_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Progress Payment state management class
class CustomProfileDetailBottomSheetBloc
    extends BaseCubit<CustomProfileDetailBottomSheetState> {
  ///
  CustomProfileDetailBottomSheetBloc()
      : super(
          CustomProfileDetailBottomSheetState(
            isButtonEnable: false,
            sheetList: [
              BottomSheetModel(id: 0, value: false, title: 'Ad - Soyad'),
              BottomSheetModel(id: 1, value: false, title: 'GSM No'),
              BottomSheetModel(id: 2, value: false, title: 'E-mail Adresi'),
              BottomSheetModel(id: 3, value: false, title: 'Adres'),
              BottomSheetModel(
                id: 4,
                value: false,
                title: 'Eğitim Bilgileri',
              ),
              BottomSheetModel(
                id: 5,
                value: false,
                title: 'Askerlik Tecil Tarihi',
              ),
            ],
          ),
        );

  /// change value obscure
  void changeButtonEnable({required bool value}) {
    emit(state.copyWith(isButtonEnable: value));
  }

  /// For change selected date
  void changeList(List<BottomSheetModel> list) {
    emit(state.copyWith(sheetList: list));
  }
}
