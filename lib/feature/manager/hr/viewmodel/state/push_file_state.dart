// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/models/file_model.dart';

class PushFileState extends Equatable {
  const PushFileState({
    this.filesList,
    this.selectedFiles,
    this.selectedFileCounter = 0,
  });

  final List<FileModel>? filesList;
  final List<FileModel>? selectedFiles;
  final int selectedFileCounter;

  @override
  List<Object?> get props => [
        filesList,
        selectedFiles,
        selectedFileCounter,
      ];

  PushFileState copyWith({
    List<FileModel>? filesList,
    List<FileModel>? selectedFiles,
    int? selectedFileCounter,
  }) {
    return PushFileState(
      filesList: filesList ?? this.filesList,
      selectedFiles: selectedFiles ?? this.selectedFiles,
      selectedFileCounter: selectedFileCounter ?? this.selectedFileCounter,
    );
  }
}
