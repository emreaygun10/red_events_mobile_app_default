import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_profile_header.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileShiftsListView extends StatelessWidget {
  const ProfileShiftsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          CustomProfileHeader(
            columnList: [
              const SizedBox(
                height: 16,
              ),
              buildTitleText(context),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Container(
              padding: const ProjectPadding.scaffold(),
              color: ColorName.neutral0,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => ListTile(
                  title: const Padding(
                    padding: ProjectPadding.symmetricXSmallV(),
                    child: Text('Emre Aygün'),
                  ),
                  subtitle: Row(
                    children: [
                      GestureDetector(
                        child: buildShiftRectangle(
                          day: 'Pzt',
                          clock: '7:30',
                          context: context,
                        ),
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricXSmallH(),
                        child: buildShiftRectangle(
                          day: 'Sal',
                          clock: '7:45',
                          context: context,
                        ),
                      ),
                      buildShiftRectangle(
                        day: 'Çar',
                        clock: '7:50',
                        context: context,
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricXSmallH(),
                        child: buildShiftRectangle(
                          day: 'Per',
                          clock: '8:30',
                          context: context,
                        ),
                      ),
                      buildShiftRectangle(
                        day: 'Cum',
                        clock: '7:30',
                        context: context,
                      ),
                      Padding(
                        padding: const ProjectPadding.symmetricXSmallH(),
                        child: buildShiftRectangle(
                          day: 'Cmt',
                          clock: '7:30',
                          context: context,
                        ),
                      ),
                      buildShiftRectangle(
                        day: 'Paz',
                        clock: '7:30',
                        context: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomPopup buildShiftRectangle({
    required String day,
    required String clock,
    required BuildContext context,
  }) {
    return CustomPopup(
      barrierColor: ColorName.neutral200.withOpacity(0.4),
      content: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            AutoSizeText(day),
            AutoSizeText('Başlangıç Saati: $clock'),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorName.blueBase,
        ),
        padding: const ProjectPadding.allXSmall(),
        height: 50.h,
        width: 40.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: AutoSizeText(day)),
            Expanded(child: AutoSizeText(clock)),
          ],
        ),
      ),
    );
  }

  Padding buildTitleText(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: AutoSizeText(
        'Shiftler',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ColorName.neutral900,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: ColorName.neutral0,
      leadingWidth: 80.w,
      leading: Padding(
        padding: const ProjectPadding.scaffold(),
        child: GestureDetector(
          onTap: () => context.router.pop(),
          child: Container(
            height: 24.h,
            width: 24.w,
            padding: const ProjectPadding.allSmall(),
            decoration: const BoxDecoration(
              color: ColorName.neutral200,
              shape: BoxShape.circle,
            ),
            child: Assets.icons.icArroeLeftS.toGetSvg(),
          ),
        ),
      ),
    );
  }
}
