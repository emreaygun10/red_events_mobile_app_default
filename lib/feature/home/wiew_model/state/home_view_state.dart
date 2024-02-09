// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.isLoading,
    required this.activeDayIndex,
  });
  final bool isLoading;
  final int activeDayIndex;
  @override
  List<Object?> get props => [
        isLoading,
        activeDayIndex,
      ];

  HomeState copyWith({
    bool? isLoading,
    int? activeDayIndex,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      activeDayIndex: activeDayIndex ?? this.activeDayIndex,
    );
  }
}
