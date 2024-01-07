import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  /// All Padding
  ///
  /// [ProjectPadding.allXSmall] is 3
  const ProjectPadding.allXSmall() : super.all(3);

  /// [ProjectPadding.allSmall] is 8
  const ProjectPadding.allSmall() : super.all(8);

  /// [ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium() : super.all(16);

  /// [ProjectPadding.allNormal] is 20
  const ProjectPadding.allNormal() : super.all(20);

  /// [ProjectPadding.allLarge] is 32
  const ProjectPadding.allLarge() : super.all(32);

  /// Symmetric
  /// [ProjectPadding.symmetricXSmallH] is 5
  const ProjectPadding.symmetricXSmallH() : super.symmetric(horizontal: 5);

  /// [ProjectPadding.symmetricSmallV] is 8
  const ProjectPadding.symmetricSmallV() : super.symmetric(vertical: 8);

  /// [ProjectPadding.symmetricMediumV] is 12
  const ProjectPadding.symmetricMediumV() : super.symmetric(vertical: 12);

  /// [ProjectPadding.symmetricNormalV] is 16
  const ProjectPadding.symmetricNormalV() : super.symmetric(vertical: 16);

  /// [ProjectPadding.symmetricLargeV] is 24
  const ProjectPadding.symmetricLargeV() : super.symmetric(vertical: 24);

  /// [ProjectPadding.scaffold] is 4
  const ProjectPadding.scaffold() : super.symmetric(horizontal: 20);

  /// [ProjectPadding.timerPadding] is vertical 24
  const ProjectPadding.timerPadding() : super.symmetric(vertical: 24);

  /// Only left,right,bottom

  /// [ProjectPadding.onlyBottomXSmall] is 4
  const ProjectPadding.onlyBottomXSmall() : super.only(bottom: 4);

  /// [ProjectPadding.onlyBottomSmall] is 8
  const ProjectPadding.onlyBottomSmall() : super.only(bottom: 8);

  /// [ProjectPadding.onlyBottomLarge] is 20
  const ProjectPadding.onlyBottomLarge() : super.only(bottom: 20);

  /// [ProjectPadding.onlyTopXSmall] is 4
  const ProjectPadding.onlyTopXSmall() : super.only(top: 4);

  /// [ProjectPadding.onlyTopSmall] is 8
  const ProjectPadding.onlyTopSmall() : super.only(top: 8);

  /// [ProjectPadding.onlyTopLarge] is 16
  const ProjectPadding.onlyTopLarge() : super.only(bottom: 16);

  /// [ProjectPadding.textFormFieldIcon] custom padding for text field form icon
  const ProjectPadding.textFormFieldIcon()
      : super.only(left: 12, top: 10, right: 8, bottom: 10);

  /// Custom
  /// [ProjectPadding.textFormFieldPadding] custom padding for text field form
  /// left 12, bottom 9,top 9, right 10
  const ProjectPadding.textFormFieldPadding()
      : super.only(
          left: 12,
          bottom: 9,
          top: 9,
          right: 10,
        );
}
