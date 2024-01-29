// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileRequestOthersState extends Equatable {
  const ProfileRequestOthersState({
    required this.isLoading,
    this.explanation,
  });

  final bool isLoading;
  final String? explanation;

  @override
  List<Object?> get props => [
        isLoading,
        explanation,
      ];

  ProfileRequestOthersState copyWith({
    String? explanation,
    bool? isLoading,
  }) {
    return ProfileRequestOthersState(
      isLoading: isLoading ?? this.isLoading,
      explanation: explanation ?? explanation,
    );
  }
}
