import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    required this.textTheme,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    required this.text,
    super.key,
    this.predicate = true,
    this.isDisable = false,
  });

  final TextTheme textTheme;
  final Color backgroundColor;
  final Color textColor;
  final void Function() onTap;
  final bool predicate;
  final bool isDisable;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          onPressed: isDisable != true ? onTap : null,
          child: AutoSizeText(
            text,
            style: textTheme.titleLarge!.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
