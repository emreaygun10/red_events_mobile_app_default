import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/custom_profile_detail_bottom_sheet_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/mixin/custom_profile_detail_bottom_sheet_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/state/custom_profile_detail_bottom_sheet_state.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

class CustomProfileDetailBottomSheet extends StatefulWidget {
  const CustomProfileDetailBottomSheet({super.key});

  @override
  State<CustomProfileDetailBottomSheet> createState() =>
      _CustomProfileDetailBottomSheetState();
}

class _CustomProfileDetailBottomSheetState
    extends BaseState<CustomProfileDetailBottomSheet>
    with CustomProfileDetailBottomSheetMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => customProfileDetailBottomSheetBloc,
      child: Column(
        children: [
          Flexible(
            child: AppBar(
              toolbarHeight: 30,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () => context.router.pop(),
                child: Assets.icons.icArroeLeftS.toGetSvgWithColor(
                  color: ColorName.neutral600,
                  height: 25,
                  width: 25,
                ),
              ),
              title: AutoSizeText(
                'Lütfen Seçiniz',
                style: textTheme.labelLarge,
              ),
            ),
          ),
          Flexible(
            flex: 8,
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: BlocBuilder<CustomProfileDetailBottomSheetBloc,
                  CustomProfileDetailBottomSheetState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.only(top: 10.h),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.sheetList.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                CheckboxListTile(
                                  checkboxShape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: ColorName.neutral500,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  side: const BorderSide(
                                    color: ColorName.neutral300,
                                  ),
                                  checkColor: ColorName.neutral0,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: AutoSizeText(
                                    state.sheetList[index].title,
                                  ),
                                  onChanged: (bool? value) {
                                    changeListOnePieceValue(
                                      state.sheetList[index],
                                    );
                                    if (state.sheetList
                                        .where(
                                          (element) => element.value == true,
                                        )
                                        .isNotEmpty) {
                                      customProfileDetailBottomSheetBloc
                                          .changeButtonEnable(
                                        value: true,
                                      );
                                    } else {
                                      customProfileDetailBottomSheetBloc
                                          .changeButtonEnable(
                                        value: false,
                                      );
                                    }
                                    setState(() {});
                                  },
                                  value: state.sheetList[index].value,
                                ),
                                if (index < state.sheetList.length - 1)
                                  const Divider(
                                    height: 2,
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const ProjectPadding.scaffold(),
              child: BlocBuilder<CustomProfileDetailBottomSheetBloc,
                  CustomProfileDetailBottomSheetState>(
                builder: (context, state) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.isButtonEnable
                            ? ColorName.blueBase
                            : ColorName.neutral200,
                        width: 2,
                      ),
                      borderRadius: ProjectBorderRadius.allCircleLarge(),
                    ),
                    height: 56.h,
                    width: context.sized.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.isButtonEnable
                            ? ColorName.neutral0
                            : ColorName.neutral200,
                      ),
                      onPressed: () {
                        state.isButtonEnable
                            ? context.router.pop(state.sheetList)
                            : null;
                      },
                      child: AutoSizeText(
                        'Devam',
                        style: textTheme.titleMedium!.copyWith(
                          color: state.isButtonEnable
                              ? ColorName.blueBase
                              : ColorName.neutral400,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
        ],
      ),
    );
  }
}
