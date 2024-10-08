// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomDescriptionRow extends StatelessWidget {
  const CustomDescriptionRow({
    required this.firstText,
    required this.secondText,
    required this.rating,
    super.key,
  });

  final String firstText;
  final String secondText;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          firstText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorName.neutral500),
        ),
        Padding(
          padding: const ProjectPadding.symmetricSmallH(),
          child: Assets.icons.icDot.svg(package: ModuleEnum.gen.value),
        ),
        AutoSizeText(
          secondText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorName.neutral500),
        ),
        Padding(
          padding: const ProjectPadding.symmetricSmallH(),
          child: Assets.icons.icDot.svg(package: ModuleEnum.gen.value),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AutoSizeText(
              rating,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorName.neutral900),
            ),
            Assets.icons.icStarFill.svg(package: ModuleEnum.gen.value),
          ],
        ),
      ],
    );
  }
}
