// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ManagerBottomNavigationState extends Equatable {
  const ManagerBottomNavigationState({required this.activePage});
  final int activePage;

  @override
  List<Object?> get props => [activePage];

  ManagerBottomNavigationState copyWith({
    int? activePage,
  }) {
    return ManagerBottomNavigationState(
      activePage: activePage ?? this.activePage,
    );
  }
}
