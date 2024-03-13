import 'package:red_events_mobile_app_defult/feature/manager/hr/view/bottom_sheet_views/push_file_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/custom_file_list_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin CustomFileListTileMixin on BaseState<CustomFileListTile> {
  late final CustomFileListTileBloc customFileListTileBloc;
  @override
  void initState() {
    customFileListTileBloc =
        CustomFileListTileBloc(fileModel: widget.fileModel);
    super.initState();
  }
}
