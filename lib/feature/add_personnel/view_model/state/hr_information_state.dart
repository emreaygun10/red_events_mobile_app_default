// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';

final class HrInformationState extends Equatable {
  const HrInformationState({
    required this.isLoading,
    required this.departmentFocus,
    required this.startedDateFocus,
    required this.sectionFocus,
    required this.workTypeFocus,
    required this.partFocus,
    required this.linearProgressEnum,
  });
  final bool isLoading;

  final bool startedDateFocus;

  final bool departmentFocus;

  final bool sectionFocus;

  final bool workTypeFocus;

  final bool partFocus;

  final LinearProgressEnum linearProgressEnum;

  @override
  List<Object?> get props => [
        isLoading,
        departmentFocus,
        startedDateFocus,
        sectionFocus,
        workTypeFocus,
        partFocus,
        linearProgressEnum,
      ];

  HrInformationState copyWith({
    bool? isLoading,
    bool? departmentFocus,
    bool? startedDateFocus,
    bool? sectionFocus,
    bool? workTypeFocus,
    bool? partFocus,
    LinearProgressEnum? linearProgressEnum,
  }) {
    return HrInformationState(
      isLoading: isLoading ?? this.isLoading,
      departmentFocus: departmentFocus ?? this.departmentFocus,
      startedDateFocus: startedDateFocus ?? this.departmentFocus,
      sectionFocus: sectionFocus ?? this.departmentFocus,
      workTypeFocus: workTypeFocus ?? this.workTypeFocus,
      partFocus: partFocus ?? this.departmentFocus,
      linearProgressEnum: linearProgressEnum ?? this.linearProgressEnum,
    );
  }
}
