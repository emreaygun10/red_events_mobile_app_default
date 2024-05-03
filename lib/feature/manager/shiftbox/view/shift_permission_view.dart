import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/mixin/shift_permission_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_bottom_sheet_container.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/widgets/custom_bottom_sheet_timer.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/bloc/shift_permission_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view_model/state/shift_permission_state.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/widgets/custom_bottom_button.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/manager_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_success_model_bottom_sheet_content.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ShiftPermissionView extends StatefulWidget {
  const ShiftPermissionView({
    required this.fromTheView,
    super.key,
  });

  final FromTheView fromTheView;

  @override
  State<ShiftPermissionView> createState() => _ShiftPermissionViewState();
}

class _ShiftPermissionViewState extends BaseState<ShiftPermissionView>
    with ShiftPermissionMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => shiftPermissionBloc,
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: SizedBox(
            height: 120.h,
            child: buildBottomNavigationColumn(context),
          ),
        ),
        appBar: AppBar(
          backgroundColor: ColorName.neutral100,
          surfaceTintColor: Colors.transparent,
          title: AutoSizeText(
            widget.fromTheView.appBarText,
            style: textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const ProjectPadding.scaffold(),
            child: BlocBuilder<ShiftPermissionBloc, ShiftPermissionState>(
              builder: (context, state) {
                return Column(
                  children: [
                    if (widget.fromTheView == FromTheView.weaklyView)
                      buildRadioGroup(state)
                    else
                      const SizedBox(),
                    if (state.formType)
                      buildPermissionColumn()
                    else
                      buildAddShiftGeneral(state),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column buildAddShiftGeneral(ShiftPermissionState state) {
    return Column(
      children: [
        buildAddShiftColumn(),
        if (state.openSecondForm)
          Padding(
            padding: const ProjectPadding.symmetricMediumV(),
            child: Divider(
              color: ColorName.neutral300,
              height: 20.h,
            ),
          )
        else
          const SizedBox(),
        if (state.openSecondForm) buildAddShiftColumn() else const SizedBox(),
        buildSecondFormOperationText(state),
      ],
    );
  }

  Row buildSecondFormOperationText(ShiftPermissionState state) {
    return Row(
      children: [
        TextButton(
          onPressed: () => shiftPermissionBloc.openOrCloseSecondForm(),
          child: state.openSecondForm
              ? Row(
                  children: [
                    Assets.icons.icDeleteBin.toGetSvgWithColor(
                      color: ColorName.redBase,
                    ),
                    const Text(
                      ' Shifti sil',
                      style: TextStyle(color: ColorName.redBase),
                    ),
                  ],
                )
              : const Text('+ Aynı güne shift ekle'),
        ),
      ],
    );
  }

  Column buildPermissionColumn() {
    return Column(
      children: [
        CustomBottomSheetContainer(
          hintText: AddShiftEnums.type.value,
          onTap: () {},
        ),
        const CustomBottomSheetTimer(
          hintText: LocaleKeys.manager_shift_detail_start_time,
        ),
        const CustomBottomSheetTimer(
          hintText: LocaleKeys.manager_shift_detail_end_time,
        ),
      ],
    );
  }

  Column buildAddShiftColumn() {
    return Column(
      children: [
        CustomBottomSheetContainer(
          hintText: AddShiftEnums.type.value,
          onTap: () {},
        ),
        CustomBottomSheetContainer(
          hintText: AddShiftEnums.type.value,
          onTap: () {},
        ),
        const CustomBottomSheetTimer(
          hintText: LocaleKeys.manager_shift_detail_start_time,
        ),
        const CustomBottomSheetTimer(
          hintText: LocaleKeys.manager_shift_detail_end_time,
        ),
      ],
    );
  }

  Column buildBottomNavigationColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        BlocBuilder<ShiftPermissionBloc, ShiftPermissionState>(
          builder: (context, state) {
            return !state.formType &&
                    widget.fromTheView == FromTheView.weaklyView
                ? CheckboxListTile(
                    value: state.sendNotification,
                    onChanged: (value) =>
                        shiftPermissionBloc.changeSendNotification(
                      value ?? false,
                    ),
                    title: const AutoSizeText('Bildirim gönder'),
                  )
                : const SizedBox();
          },
        ),
        CustomBottomButton(
          textTheme: textTheme,
          backgroundColor: ColorName.blueBase,
          textColor: ColorName.neutral0,
          onTap: () async {
            /// TODO: gerekli api işlemleri
            await showModalBottomSheet<void>(
              isScrollControlled: true,
              context: context,
              showDragHandle: true,
              builder: (BuildContext context) {
                return CustomSuccessModelBottomSheetContent(
                  text: widget.fromTheView == FromTheView.personelDetail
                      ? 'Shift başarılı bir şekilde düzenlendi'
                      : 'Shift başarılı bir şekilde eklendi',
                );
              },
            );
            if (context.mounted) {
              await context.router.pop();
            }
          },
          text: widget.fromTheView.buttonText,
        ),
      ],
    );
  }

  Row buildRadioGroup(ShiftPermissionState state) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            value: false,
            groupValue: state.formType,
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return ColorName.blueBase;
                }
                return ColorName.neutral400;
              },
            ),
            onChanged: (value) {
              shiftPermissionBloc.changeFormType(value ?? false);
            },
            title: Text(
              'Shift Ekle',
              style: textTheme.titleMedium!.copyWith(
                fontWeight:
                    state.formType == false ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
        Expanded(
          child: RadioListTile(
            value: true,
            groupValue: state.formType,
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return ColorName.blueBase;
                }
                return ColorName.neutral400;
              },
            ),
            onChanged: (value) {
              shiftPermissionBloc.changeFormType(value ?? false);
            },
            title: Text(
              'İzin Ekle',
              style: textTheme.titleMedium!.copyWith(
                fontWeight:
                    state.formType == true ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
