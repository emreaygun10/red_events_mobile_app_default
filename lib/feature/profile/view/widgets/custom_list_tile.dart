import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.textTheme,
    required this.date,
    required this.hours,
    required this.currency,
    required this.company,
    this.chipColor,
    this.chipText,
    this.showChip = false,
    super.key,
  });

  final TextTheme textTheme;
  final Color? chipColor;
  final String date;
  final String hours;
  final String? chipText;
  final String currency;
  final String company;
  final bool showChip;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const ProjectPadding.allSmall(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: date,
                      style: textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '-',
                      style: textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral900,
                      ),
                    ),
                    TextSpan(
                      text: hours,
                      style: textTheme.titleSmall!.copyWith(
                        color: ColorName.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
              if (showChip)
                Chip(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: chipColor ?? ColorName.neutral0,
                    ),
                  ),
                  color: MaterialStatePropertyAll(
                    chipColor,
                  ),
                  label: AutoSizeText(
                    chipText ?? '',
                    style: textTheme.titleSmall,
                  ),
                ),
              AutoSizeText(
                currency,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          AutoSizeText(company),
        ],
      ),
    );
  }
}
