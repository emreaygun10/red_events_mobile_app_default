import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class CustomEnforcedStar extends StatelessWidget {
  const CustomEnforcedStar({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '*',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: ColorName.redBase,
          ),
    );
  }
}
