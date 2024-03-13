// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';

class CustomFileListTileState extends Equatable {
  const CustomFileListTileState({required this.fileModel});

  final FileModel fileModel;

  CustomFileListTileState copyWith({
    FileModel? fileModel,
  }) {
    return CustomFileListTileState(
      fileModel: fileModel ?? this.fileModel,
    );
  }

  @override
  List<Object?> get props => [fileModel];
}
