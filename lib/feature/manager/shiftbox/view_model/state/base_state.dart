// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class BaseViewState extends Equatable {
  const BaseViewState({required this.pageIndex});

  final int pageIndex;
  @override
  List<Object?> get props => [pageIndex];

  BaseViewState copyWith({
    int? pageIndex,
  }) {
    return BaseViewState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
