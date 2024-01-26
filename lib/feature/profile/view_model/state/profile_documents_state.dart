// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileDocumentsState extends Equatable {
  const ProfileDocumentsState({
    required this.chipIndex,
    required this.isLoading,
    this.data,
    this.missingDocumentsCounter,
  });
  final bool chipIndex;
  final bool isLoading;
  final String? data;
  final int? missingDocumentsCounter;

  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        data,
        missingDocumentsCounter,
      ];

  ProfileDocumentsState copyWith({
    bool? chipIndex,
    bool? isLoading,
    String? data,
    int? missingDocumentsCounter,
  }) {
    return ProfileDocumentsState(
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      missingDocumentsCounter:
          missingDocumentsCounter ?? this.missingDocumentsCounter,
    );
  }
}
