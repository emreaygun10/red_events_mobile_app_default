// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class HomeState extends Equatable {
  const HomeState({
    required this.isLoading,
    required this.activeDayIndex,
    required this.isAccepted,
  });
  final bool isLoading;
  final int activeDayIndex;
  final bool isAccepted;
  @override
  List<Object?> get props => [
        isLoading,
        activeDayIndex,
        isAccepted,
      ];

  HomeState copyWith({
    bool? isLoading,
    int? activeDayIndex,
    bool? isAccepted,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      activeDayIndex: activeDayIndex ?? this.activeDayIndex,
      isAccepted: isAccepted ?? this.isAccepted,
    );
  }
}
