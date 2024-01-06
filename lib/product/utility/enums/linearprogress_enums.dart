/// Linear step enum
enum LinearProgressEnum {
  /// Linear Progress step one
  levelOne(0.33, 1),

  /// Linear Progress step two
  levelTwo(0.66, 2),

  /// Linear Progress step three
  levelThree(1, 3);

  /// double value
  final double value;

  final int step;

  ///
  const LinearProgressEnum(this.value, this.step);
}
