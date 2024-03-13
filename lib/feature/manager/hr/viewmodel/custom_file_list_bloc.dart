import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/state/custom_file_list_tile_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';

class CustomFileListTileBloc extends BaseCubit<CustomFileListTileState> {
  CustomFileListTileBloc({required this.fileModel})
      : super(CustomFileListTileState(fileModel: fileModel));
  final FileModel fileModel;

  void changeValue({required bool value}) {
    emit(state.copyWith(fileModel: fileModel.copyWith(value: value)));
  }
}
