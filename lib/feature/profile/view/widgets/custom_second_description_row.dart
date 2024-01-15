// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomSecondDescriptionRow extends StatelessWidget {
  const CustomSecondDescriptionRow({
    required this.firstText,
    required this.secondText,
    super.key,
  });

  final String firstText;
  final String secondText;

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
        Assets.icons.icWhatsApp.svg(package: ModuleEnum.gen.value),
        AutoSizeText(
          secondText,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: ColorName.neutral500),
        ),
      ],
    );
  }
}
