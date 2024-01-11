// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/mixin/hr_informations_mixin.dart';
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
    required this.isPriceInfoBool,
    this.customCurrency,
    this.department,
    this.mission,
    this.section,
    this.startedDate,
    this.workType,
  });
  final bool isLoading;

  final bool startedDateFocus;

  final bool departmentFocus;

  final bool sectionFocus;

  final bool workTypeFocus;

  final bool partFocus;

  final DateTime? startedDate;

  final CustomCurrency? customCurrency;

  final String? department;

  final String? section;

  final String? workType;

  final String? mission;

  final bool isPriceInfoBool;

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
        section,
        department,
        workType,
        mission,
        startedDate,
        isPriceInfoBool,
        customCurrency,
      ];

  HrInformationState copyWith({
    bool? isLoading,
    bool? departmentFocus,
    bool? startedDateFocus,
    bool? sectionFocus,
    bool? workTypeFocus,
    bool? partFocus,
    bool? birthDateFocus,
    LinearProgressEnum? linearProgressEnum,
    DateTime? startedDate,
    String? department,
    String? section,
    String? workType,
    String? mission,
    bool? isPriceInfoBool,
    CustomCurrency? customCurrency,
  }) {
    return HrInformationState(
      isLoading: isLoading ?? this.isLoading,
      departmentFocus: departmentFocus ?? this.departmentFocus,
      startedDateFocus: startedDateFocus ?? this.departmentFocus,
      sectionFocus: sectionFocus ?? this.departmentFocus,
      workTypeFocus: workTypeFocus ?? this.workTypeFocus,
      partFocus: partFocus ?? this.departmentFocus,
      linearProgressEnum: linearProgressEnum ?? this.linearProgressEnum,
      isPriceInfoBool: isPriceInfoBool ?? this.isPriceInfoBool,
      department: department ?? this.department,
      startedDate: startedDate ?? this.startedDate,
      section: section ?? this.section,
      workType: workType ?? this.workType,
      mission: mission ?? this.mission,
      customCurrency: customCurrency ?? this.customCurrency,
    );
  }
}
