import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/bottom_sheet_views/push_file_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/push_file_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

mixin PushFileMixin on BaseState<PushFileView> {
  late final PushFileBloc pushFileBloc;
  late final SolidController solidController;
  late final List<FileModel> tempFileList;
  late final TextEditingController textEditingController;
  @override
  void initState() {
    pushFileBloc = PushFileBloc(tempSelectedList: []);
    solidController = SolidController();
    textEditingController = TextEditingController();
    pushFileBloc.changeList(
      [
        FileModel(name: 'Sabıka Kaydı'),
        FileModel(name: 'Sağlık Raporu'),
        FileModel(name: 'Hijyen Belgesi'),
        FileModel(name: 'KVKK İzin Belgelsi'),
        FileModel(name: 'Diplama'),
        FileModel(name: 'Kimlik'),
        FileModel(name: 'Sabıka Kaydı'),
        FileModel(name: 'Sağlık Raporu'),
        FileModel(name: 'Hijyen Belgesi'),
        FileModel(name: 'KVKK İzin Belgelsi'),
        FileModel(name: 'Diplama'),
        FileModel(name: 'Kimlik'),
      ],
    );
    tempFileList = pushFileBloc.state.filesList!;

    super.initState();
  }
}
