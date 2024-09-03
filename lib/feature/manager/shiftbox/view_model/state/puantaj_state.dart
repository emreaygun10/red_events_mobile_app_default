// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PuantajState extends Equatable {
  const PuantajState({
    required this.isWeakly,
    required this.selectedDate,
    required this.personnel,
    required this.totalHours,
    required this.totalMouth,
  });

  final bool isWeakly;
  final DateTime selectedDate;
  final int personnel;
  final int totalHours;
  final String totalMouth;

  @override
  List<Object?> get props => [
        isWeakly,
        selectedDate,
        personnel,
        totalHours,
        totalMouth,
      ];

  PuantajState copyWith({
    bool? isWeakly,
    DateTime? selectedDate,
    int? personnel,
    int? totalHours,
    String? totalMouth,
  }) {
    return PuantajState(
      isWeakly: isWeakly ?? this.isWeakly,
      selectedDate: selectedDate ?? this.selectedDate,
      personnel: personnel ?? this.personnel,
      totalHours: totalHours ?? this.totalHours,
      totalMouth: totalMouth ?? this.totalMouth,
    );
  }
}
