import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/push_file_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class PushFileBloc extends BaseCubit<PushFileState> {
  PushFileBloc({required this.tempSelectedList})
      : super(
          const PushFileState(),
        );

  final List<FileModel> tempSelectedList;
  void changeSelectedList(FileModel selectedFiles) {
    tempSelectedList.add(selectedFiles);
    emit(
      state.copyWith(
        selectedFiles: tempSelectedList,
        selectedFileCounter: tempSelectedList.length,
      ),
    );
  }

  void changeList(List<FileModel> files) {
    emit(state.copyWith(filesList: files));
  }
}
