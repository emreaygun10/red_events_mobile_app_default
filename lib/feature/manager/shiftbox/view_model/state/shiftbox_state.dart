// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ShiftBoxState extends Equatable {
  const ShiftBoxState({required this.selectedMonth});

  final DateTime selectedMonth;
  @override
  List<Object?> get props => [selectedMonth];

  ShiftBoxState copyWith({
    DateTime? selectedMonth,
  }) {
    return ShiftBoxState(
      selectedMonth: selectedMonth ?? this.selectedMonth,
    );
  }
}
