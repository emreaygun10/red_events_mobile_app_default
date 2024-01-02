import 'package:flutter/material.dart';

/// Project general insets items
final class ProjectBorderRadius extends BorderRadius {
  const ProjectBorderRadius._() : super.all(const Radius.circular(0));

  /// All

  /// Circle
  /// [ProjectBorderRadius.allCircleSmall] is 10
  ProjectBorderRadius.allCircleSmall() : super.circular(10);

  /// [ProjectBorderRadius.allCircleMedium] is 10
  ProjectBorderRadius.allCircleMedium() : super.circular(12);

  /// [ProjectBorderRadius.allCircleNormal] is 10
  ProjectBorderRadius.allCircleNormal() : super.circular(20);

  /// [ProjectBorderRadius.allCircleLarge] is 30
  ProjectBorderRadius.allCircleLarge() : super.circular(30);
}
