// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/linearprogress_enums.dart';

final class DocumentState extends Equatable {
  const DocumentState({
    required this.isLoading,
    required this.linearProgressEnum,
  });
  final bool isLoading;

  final LinearProgressEnum linearProgressEnum;

  @override
  List<Object?> get props => [
        isLoading,
        linearProgressEnum,
      ];

  DocumentState copyWith({
    bool? isLoading,
    LinearProgressEnum? linearProgressEnum,
  }) {
    return DocumentState(
      isLoading: isLoading ?? this.isLoading,
      linearProgressEnum: linearProgressEnum ?? this.linearProgressEnum,
    );
  }
}
