import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';

class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({
    required this.textTheme,
    super.key,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: 148.h,
            width: 148.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.orangeLighter,
            ),
            child: Assets.icons.icFinanceBanking.toGetSvg(),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 19, bottom: 4).r,
            child: AutoSizeText(
              'Oluşturulmuş talep bulunmamaktadır.',
              style: textTheme.titleLarge!.copyWith(
                color: ColorName.neutral900,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Flexible(
          child: AutoSizeText(
            'Yeni Talep oluşturduğunuzda talepleriniz burada listelenecektir.',
            style: textTheme.titleMedium!.copyWith(
              color: ColorName.neutral500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
