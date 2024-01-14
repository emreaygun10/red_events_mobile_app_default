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
    super.key,
    this.isWhatsappIcon = false,
  });

  final String firstText;
  final String secondText;
  final bool isWhatsappIcon;

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
        if (isWhatsappIcon)
          Assets.icons.icWhatsApp.svg(package: ModuleEnum.gen.value)
        else
          const SizedBox(),
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
