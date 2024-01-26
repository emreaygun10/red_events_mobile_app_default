import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/profile_documents_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

/// Profile Documents state management class
class ProfileDocumentsBloc extends BaseCubit<ProfileDocumentsState> {
  ///
  ProfileDocumentsBloc()
      : super(
          const ProfileDocumentsState(
            isLoading: false,
            chipIndex: true,
            missingDocumentsCounter: 2,
          ),
        );

  /// change value obscure
  void changeChipIndex() {
    emit(state.copyWith(chipIndex: !state.chipIndex));
  }

  ///change response list to list
  void missingDocumentCounter(int value) {
    emit(state.copyWith(missingDocumentsCounter: value));
  }
}
