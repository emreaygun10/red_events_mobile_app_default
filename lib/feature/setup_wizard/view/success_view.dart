import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.success,
      body: Padding(
        padding: const ProjectPadding.scaffold(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCustomCircle(),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12).r,
                child: AutoSizeText(
                  'Kurulum sihirbazı başarılı bir şekilde tamamlandı.',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: ColorName.neutral700,
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              AutoSizeText(
                'IK > Personel Listesinden istediğiniz zaman personel bilgilerini güncelleyebilirsiniz.',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorName.neutral500),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24).r,
                child: SizedBox(
                  height: 56.h,
                  width: 240.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.neutral700,
                    ),
                    onPressed: () {
                      context.router.pushAndPopUntil(
                        const BottomNAvigationBarRoute(),
                        predicate: (route) => false,
                      );
                    },
                    child: AutoSizeText(
                      'Anasayfaya Git',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorName.neutral0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildCustomCircle() {
    return Container(
      height: 88.h,
      width: 88.w,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            ColorName.neutral0,
            ColorName.success,
          ],
        ),
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(14).r,
          height: 56.h,
          width: 56.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorName.success,
          ),
          child: Assets.icons.icCheckLine
              .toGetSvgWithColor(color: ColorName.neutral0),
        ),
      ),
    );
  }
}
