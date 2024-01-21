import 'package:equatable/equatable.dart';

final class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState({
    required this.isLoading,
    required this.activePage,
  });
  final bool isLoading;
  final int activePage;

  @override
  List<Object?> get props => [
        isLoading,
        activePage,
      ];

  BottomNavigationBarState copyWith({
    bool? isLoading,
    int? activePage,
  }) {
    return BottomNavigationBarState(
      isLoading: isLoading ?? this.isLoading,
      activePage: activePage ?? this.activePage,
    );
  }
}
