import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_education_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Education state management class
class ProfileEducationBloc extends BaseCubit<ProfileEducationState> {
  ///
  ProfileEducationBloc()
      : super(
          const ProfileEducationState(
            isLoading: false,
            chipIndex: 0,
            educationList: ['deneme'],
          ),
        );

  /// change value obscure
  void changeChipIndex(int index) {
    emit(state.copyWith(chipIndex: index));
  }

  ///change response list to list
  void changeList(List<String> responseList) {
    emit(state.copyWith(educationList: responseList));
  }
}
