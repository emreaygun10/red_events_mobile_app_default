import 'package:equatable/equatable.dart';

class WorkTypeState extends Equatable {
  const WorkTypeState({
    required this.switchIsEnable,
    required this.clock,
    required this.questionOne,
    required this.questionTwo,
    required this.questionThree,
    required this.isDisable,
  });

  final bool switchIsEnable;
  final int clock;
  final int questionOne;
  final int questionTwo;
  final int questionThree;
  final bool isDisable;
  @override
  List<Object?> get props => [
        questionOne,
        questionTwo,
        questionThree,
        switchIsEnable,
        clock,
        isDisable,
      ];

  WorkTypeState copyWith({
    bool? switchIsEnable,
    int? clock,
    int? questionOne,
    int? questionTwo,
    int? questionThree,
    bool? isDisable,
  }) {
    return WorkTypeState(
      switchIsEnable: switchIsEnable ?? this.switchIsEnable,
      clock: clock ?? this.clock,
      questionThree: questionThree ?? this.questionThree,
      questionOne: questionOne ?? this.questionOne,
      questionTwo: questionTwo ?? this.questionTwo,
      isDisable: isDisable ?? this.isDisable,
    );
  }
}
