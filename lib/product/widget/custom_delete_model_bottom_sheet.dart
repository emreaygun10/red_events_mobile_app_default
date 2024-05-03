import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:widgets/widgets.dart';

class CustomDeleteShowModelBottomSheet extends StatelessWidget {
  const CustomDeleteShowModelBottomSheet({
    required this.ctx,
    super.key,
  });
  final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Column(
          children: [
            const AutoSizeText(
              'Uyarı',
            ),
            const Padding(
              padding: ProjectPadding.symmetricSmallV(),
              child: Divider(
                height: 2,
                color: ColorName.neutral300,
              ),
            ),
            SizedBox(
              height: 450.h,
              child: Column(
                children: [
                  SizedBox(
                    height: 32.h,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 88.h,
                        width: 88.w,
                        padding: const ProjectPadding.allMedium(),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.neutral200,
                        ),
                      ),
                      Container(
                        height: 56.h,
                        width: 56.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorName.orangeBase,
                        ),
                      ),
                      Assets.icons.icDeleteBin.toGetSvgWithColor(
                        color: ColorName.neutral0,
                      ),
                    ],
                  ),
                  const Spacer(),
                  AutoSizeText(
                    'Shifti silmek istediğinize emin misiniz?',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  AutoSizeText(
                    'Shift’i silmeniz durumunda shift bilgileri ve bu shifte eklenmiş personeller de silinip boşa düşer.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorName.neutral500),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  buildCustomButton(
                    context: ctx,
                    text: 'Sil',
                    value: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  buildCustomButton(
                    context: ctx,
                    text: 'Vazgeç',
                    backgroundColor: ColorName.neutral0,
                    textColor: ColorName.neutral500,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding buildCustomButton({
    required BuildContext context,
    required String text,
    Color? backgroundColor,
    Color? textColor,
    Object? value,
  }) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 56.h,
        width: context.sized.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? ColorName.blueBase,
          ),
          onPressed: () {
            context.router.pop(value);
          },
          child: AutoSizeText(
            text.tr(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: textColor ?? ColorName.neutral0,
                ),
          ),
        ),
      ),
    );
  }
}
