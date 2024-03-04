// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CompanyInformationState extends Equatable {
  const CompanyInformationState({
    required this.groupValue,
    required this.isShow,
    this.sectorName,
  });

  final int groupValue;
  final bool isShow;
  final String? sectorName;

  @override
  List<Object?> get props => [groupValue, isShow, sectorName];
  CompanyInformationState copyWith({
    int? groupValue,
    bool? isShow,
    String? sectorName,
  }) {
    return CompanyInformationState(
      groupValue: groupValue ?? this.groupValue,
      isShow: isShow ?? this.isShow,
      sectorName: sectorName ?? this.sectorName,
    );
  }
}
