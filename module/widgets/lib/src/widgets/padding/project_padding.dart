import 'package:flutter/material.dart';

/// Project general padding items
final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  /// All Padding
  ///

  /// [ProjectPadding.allSmall] is 8
  const ProjectPadding.allSmall() : super.all(8);

  /// [ProjectPadding.allMedium] is 16
  const ProjectPadding.allMedium() : super.all(16);

  /// [ProjectPadding.allNormal] is 20
  const ProjectPadding.allNormal() : super.all(20);

  /// [ProjectPadding.allLarge] is 32
  const ProjectPadding.allLarge() : super.all(32);

  /// Symmetric
  /// [ProjectPadding.symmetricXSmall] is 4
  const ProjectPadding.symmetricXSmall() : super.symmetric(horizontal: 5);

  /// [ProjectPadding.scaffold] is 4
  const ProjectPadding.scaffold() : super.symmetric(horizontal: 20);

  /// Only left,right,bottom
}
