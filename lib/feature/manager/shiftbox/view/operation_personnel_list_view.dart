import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_bottom_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_text_form_field.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class OperationPersonnelListView extends StatefulWidget {
  const OperationPersonnelListView({required this.operationType, super.key});

  final OperationsEnum operationType;
  @override
  State<OperationPersonnelListView> createState() =>
      _OperationPersonnelListViewState();
}

class _OperationPersonnelListViewState
    extends BaseState<OperationPersonnelListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8).r,
        height: 92.h,
        color: ColorName.neutral100,
        child: CustomBottomButton(
          isDisable: true,
          backgroundColor: ColorName.blueBase,
          text: LocaleKeys.general_button_continue.tr(),
          onTap: () {},
          textTheme: textTheme,
          textColor: ColorName.neutral0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: ColorName.neutral100,
        surfaceTintColor: ColorName.neutral100,
        title: AutoSizeText(
          widget.operationType.text,
          style: textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const ProjectPadding.scaffold(),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  LocaleKeys.manager_hr_search_all_personnel.tr(args: ['30']),
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 150.w,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: false,
                    onChanged: (value) {},
                    title: AutoSizeText(
                      'Tümünü Seç',
                      style: textTheme.titleSmall,
                    ),
                  ),
                ),
              ],
            ),
            CustomTextFormField(
              leadingAsset: Assets.icons.icSearch.toGetSvg(),
              textEditingController: TextEditingController(),
              hintText: LocaleKeys.add_personnel_hr_inform_search.tr(),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.h,
                ),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemBuilder: (context, index) => Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8).r,
                  height: 72.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: ColorName.neutral200,
                    ),
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const CircleAvatar(),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'Emre Aygün',
                              style: textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 16.h,
                              child: Row(
                                children: [
                                  buildCustomChip(text: 'FT'),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  buildCustomChip(text: 'Garson'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildCustomChip({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ).r,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
            color: ColorName.neutral200,
            width: 2,
          ),
        ),
      ),
      child: AutoSizeText(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
