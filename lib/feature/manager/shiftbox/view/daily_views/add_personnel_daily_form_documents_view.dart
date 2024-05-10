import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddPersonnelDailyFormDocumentsView extends StatefulWidget {
  const AddPersonnelDailyFormDocumentsView({super.key});

  @override
  State<AddPersonnelDailyFormDocumentsView> createState() =>
      _AddPersonnelDailyFormDocumentsViewState();
}

class _AddPersonnelDailyFormDocumentsViewState
    extends BaseState<AddPersonnelDailyFormDocumentsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.neutral0,
      appBar: AppBar(
        backgroundColor: ColorName.neutral0,
        surfaceTintColor: ColorName.neutral0,
        title: Text(
          'Personnel Ekle (2/2)',
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const ProjectPadding.scaffold(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle('YÜKLÜ BELGELERİM'),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                itemBuilder: (context, index) => buildCustomDocument(),
                itemCount: 1,
              ),
            ),
            buildTitle(LocaleKeys.add_personnel_document_desc.tr()),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 12.h,
                ),
                itemBuilder: (context, index) => buildCustomDocument(),
                itemCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 24).r,
      child: Text(
        title,
        style: textTheme.titleMedium!.copyWith(
          color: ColorName.neutral500,
        ),
      ),
    );
  }

  Container buildCustomDocument() => Container(
        height: 72.h,
        padding: const ProjectPadding.allMedium(),
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.neutral200),
          borderRadius: ProjectBorderRadius.allCircleMedium(),
        ),
        child: Row(
          children: [
            Assets.icons.icPdfTemp.toGetSvg(),
            Padding(
              padding: const ProjectPadding.symmetricMediumH(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Diploma',
                    style: textTheme.titleLarge,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          '120 KB',
                          style: textTheme.titleMedium!.copyWith(
                            color: ColorName.neutral600,
                          ),
                        ),
                        Padding(
                          padding: const ProjectPadding.symmetricXSmallH(),
                          child: Assets.icons.icSelectBoxCircleFill.toGetSvg(),
                        ),
                        Text(
                          'Complated',
                          style: textTheme.titleMedium!.copyWith(
                            color: ColorName.neutral600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
