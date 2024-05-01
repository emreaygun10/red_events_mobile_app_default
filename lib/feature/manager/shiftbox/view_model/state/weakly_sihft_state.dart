// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class WeaklyShiftState extends Equatable {
  const WeaklyShiftState({required this.selectedChip});

  final int selectedChip;
  @override
  List<Object?> get props => [selectedChip];

  WeaklyShiftState copyWith({
    int? selectedChip,
  }) {
    return WeaklyShiftState(
      selectedChip: selectedChip ?? this.selectedChip,
    );
  }
}
