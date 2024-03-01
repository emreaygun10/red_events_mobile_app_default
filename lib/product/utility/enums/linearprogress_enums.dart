/// Linear step enum
enum LinearProgressEnum {
  /// Linear Progress step one
  levelOne(0.33, 1),

  /// Linear Progress step two
  levelTwo(0.66, 2),

  /// Linear Progress step three
  levelThree(1, 3),

  ///Liner Progress step three in Five

  levelOneInFive(0.2, 1),

  ///Liner Progress step one in Five
  levelTwoInFive(0.4, 2),

  ///Liner Progress step two in Five

  levelThreeInFive(0.6, 3),

  ///Liner Progress step four in Five

  levelFourInFive(0.8, 4),

  ///Liner Progress step five in Five

  levelFiveInFive(1, 5);

  /// double value
  final double value;

  final int step;

  ///
  const LinearProgressEnum(this.value, this.step);
}
