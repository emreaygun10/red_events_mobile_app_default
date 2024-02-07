import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class CustomPayrollListItem extends StatelessWidget {
  const CustomPayrollListItem({
    required this.textTheme,
    required this.text,
    required this.subText,
    this.isOk = false,
    super.key,
  });

  final TextTheme textTheme;
  final String text;
  final String subText;
  final bool isOk;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isOk
          ? context.router.push(const ProgressPaymentDocumentReadRoute())
          : null,
      child: Container(
        padding: const ProjectPadding.allMedium(),
        decoration: BoxDecoration(
          color: ColorName.neutral0,
          border: Border.all(
            color: ColorName.neutral200,
          ),
          borderRadius: ProjectBorderRadius.allCircleNormal(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Assets.icons.icPdfTemp.svg(
                  package: ModuleEnum.gen.value,
                  height: 40,
                  width: 40,
                ),
                Padding(
                  padding: const ProjectPadding.symmetricSmallH(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        text,
                        style: textTheme.labelMedium,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText(
                            subText,
                            style: textTheme.labelSmall!.copyWith(
                              color: ColorName.neutral400,
                            ),
                          ),
                          if (isOk)
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const ProjectPadding.symmetricXSmallH(),
                                  child: Assets.icons.icDot.toGetSvg(),
                                ),
                                Assets.icons.icCalendar.toGetSvgWithColor(
                                  color: ColorName.orangeBase,
                                ),
                                AutoSizeText(
                                  'Onay Bekliyor',
                                  style: textTheme.labelSmall!.copyWith(
                                    color: ColorName.orangeBase,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Assets.icons.icDownload.toGetSvg(),
          ],
        ),
      ),
    );
  }
}
