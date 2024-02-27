import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_selection_manager_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_selection_manager_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_selection_manager_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

class CustomPayrollRequestSelectionBottomSheet extends StatefulWidget {
  const CustomPayrollRequestSelectionBottomSheet({super.key});

  @override
  State<CustomPayrollRequestSelectionBottomSheet> createState() =>
      _CustomPayrollRequestSelectionBottomSheetState();
}

class _CustomPayrollRequestSelectionBottomSheetState
    extends BaseState<CustomPayrollRequestSelectionBottomSheet>
    with ProfileRequestSelectionManagerMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileRequestSelectionManagerBloc,
      child: SizedBox(
        height: context.sized.height * 0.45,
        width: context.sized.width,
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: Column(
            children: [
              AutoSizeText(
                LocaleKeys.profile_progress_payment_chips_manager_selection
                    .tr(),
                style: textTheme.headlineMedium,
              ),
              AutoSizeText(
                LocaleKeys.profile_progress_payment_chips_max_manager.tr(),
                style:
                    textTheme.labelSmall!.copyWith(color: ColorName.neutral500),
              ),
              BlocBuilder<ProfileRequestSelectionManagerBloc,
                  ProfileRequestSelectionManagerState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: AutoSizeText(
                            state.managerList[index],
                          ),
                          leading: BlocBuilder<
                              ProfileRequestSelectionManagerBloc,
                              ProfileRequestSelectionManagerState>(
                            builder: (context, state) {
                              return Checkbox(
                                value: state.checkBoxList.contains(
                                  state.managerList[index],
                                ),
                                onChanged: (value) {
                                  if (value ?? false) {
                                    addManager(
                                      state.managerList[index],
                                    );
                                  } else {
                                    removeManager(
                                      state.managerList[index],
                                    );
                                  }
                                  setState(() {});
                                },
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: ColorName.neutral200,
                          height: 2,
                        );
                      },
                      itemCount: state.managerList.length,
                    ),
                  );
                },
              ),
              buildContinueButtonBottomSheet(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildContinueButtonBottomSheet(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV(),
      child: SizedBox(
        height: 50.h,
        width: context.sized.width,
        child: ElevatedButton(
          onPressed: () {
            context.router.pop();
          },
          child: AutoSizeText(
            LocaleKeys.general_button_continue.tr(),
            style: textTheme.titleLarge!.copyWith(
              color: ColorName.neutral0,
            ),
          ),
        ),
      ),
    );
  }
}
