// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ShiftPermissionState extends Equatable {
  const ShiftPermissionState({
    required this.formType,
    required this.sendNotification,
    required this.openSecondForm,
  });

  final bool formType;
  final bool sendNotification;
  final bool openSecondForm;

  @override
  List<Object?> get props => [
        formType,
        sendNotification,
        openSecondForm,
      ];

  ShiftPermissionState copyWith({
    bool? formType,
    bool? sendNotification,
    bool? openSecondForm,
  }) {
    return ShiftPermissionState(
      formType: formType ?? this.formType,
      sendNotification: sendNotification ?? this.sendNotification,
      openSecondForm: openSecondForm ?? this.openSecondForm,
    );
  }
}
