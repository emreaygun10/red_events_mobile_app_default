// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/model/onboard_model.dart';

final class OnboardState extends Equatable {
  const OnboardState({
    required this.isLoading,
    required this.onboardList,
    this.currentIndex = 0,
  });
  final bool isLoading;

  final int currentIndex;

  final List<OnboardModel> onboardList;
  @override
  List<Object?> get props => [isLoading, currentIndex, onboardList];

  OnboardState copyWith({
    bool? isLoading,
    int? currentIndex,
    List<OnboardModel>? onboardList,
  }) {
    return OnboardState(
      isLoading: isLoading ?? this.isLoading,
      currentIndex: currentIndex ?? this.currentIndex,
      onboardList: onboardList ?? this.onboardList,
    );
  }
}
