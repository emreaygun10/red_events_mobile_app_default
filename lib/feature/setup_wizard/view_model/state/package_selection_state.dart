// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PackageSelectionState extends Equatable {
  const PackageSelectionState({required this.groupValue});

  final int groupValue;

  @override
  List<Object?> get props => [groupValue];

  PackageSelectionState copyWith({
    int? groupValue,
  }) {
    return PackageSelectionState(
      groupValue: groupValue ?? this.groupValue,
    );
  }
}
