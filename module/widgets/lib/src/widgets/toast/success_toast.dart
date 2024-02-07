import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class SuccessToast extends StatelessWidget {
  const SuccessToast({
    required this.message,
    required this.icon,
    required this.backgroundColor,
    required this.size,
    super.key,
  });

  /// Toast Message
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: ProjectBorderRadius.allCircleNormal(),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 12,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
