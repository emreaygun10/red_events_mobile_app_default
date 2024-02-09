import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/home_view_mixin.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()

/// Home View
class HomeView extends StatefulWidget {
  // ignore: public_member_api_docs
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        height: 324.h,
        width: context.sized.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              ColorName.blueBase,
              ColorName.neutral100,
            ],
            stops: [
              0.0,
              0.95,
            ],
          ),
        ),
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const ProjectPadding.symmetricMediumH().copyWith(top: 8).r,
                decoration: BoxDecoration(
                  color: ColorName.neutral0,
                  borderRadius: ProjectBorderRadius.allCircleNormal(),
                ),
                height: 180.h,
                width: context.sized.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      '29 Ocak - 04 Şubat',
                      style: textTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    AutoSizeText(
                      'arası shift listesi',
                      style: textTheme.titleSmall!
                          .copyWith(color: ColorName.neutral400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        padding: const ProjectPadding.symmetricSmallH(),
                        decoration: BoxDecoration(
                          borderRadius: ProjectBorderRadius.allCircleLarge(),
                          color: ColorName.orangeLight,
                        ),
                        height: 20.h,
                        child: const AutoSizeText(
                          'Onay Bekleniyor',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 40.h,
                            width: 143.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  ProjectBorderRadius.allCircleMedium(),
                              border: Border.all(color: ColorName.neutral300),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Değişiklik telep et',
                                style: textTheme.titleMedium,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Container(
                            height: 40.h,
                            width: 143.w,
                            decoration: BoxDecoration(
                              color: ColorName.greenBase,
                              borderRadius:
                                  ProjectBorderRadius.allCircleMedium(),
                              border: Border.all(color: ColorName.neutral300),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Onayla',
                                style: textTheme.titleMedium!
                                    .copyWith(color: ColorName.neutral0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
