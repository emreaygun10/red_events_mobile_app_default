// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';

class AddShiftState extends Equatable {
  const AddShiftState({
    required this.addShiftEnums,
    required this.personelCounter,
    required this.isRepeat,
    this.selectedDate,
    this.endDate,
  });

  final AddShiftEnums addShiftEnums;
  final int personelCounter;
  final DateTime? selectedDate;
  final bool isRepeat;
  final DateTime? endDate;
  @override
  List<Object?> get props => [
        addShiftEnums,
        personelCounter,
        selectedDate,
        isRepeat,
        endDate,
      ];

  AddShiftState copyWith({
    AddShiftEnums? addShiftEnums,
    int? personelCounter,
    DateTime? selectedDate,
    bool? isRepeat,
    DateTime? endDate,
  }) {
    return AddShiftState(
      addShiftEnums: addShiftEnums ?? this.addShiftEnums,
      personelCounter: personelCounter ?? this.personelCounter,
      selectedDate: selectedDate ?? this.selectedDate,
      isRepeat: isRepeat ?? this.isRepeat,
      endDate: endDate ?? this.endDate,
    );
  }
}
