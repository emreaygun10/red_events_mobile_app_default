import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/state/document_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';

/// Add Personnel state management class
class DocumentCubit extends BaseCubit<DocumentState> {
  ///
  DocumentCubit()
      : super(
          const DocumentState(
            isLoading: false,
            linearProgressEnum: LinearProgressEnum.levelThree,
          ),
        );

  /// change bool values part

  /// change value idLoading
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void changeLinearProgress(LinearProgressEnum linearProgressEnum) {
    emit(state.copyWith(linearProgressEnum: linearProgressEnum));
  }
}
