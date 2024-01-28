import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_advance_payment.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/mixins/profile_request_payment_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/state/profile_request_advance_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_autosizetext_for_title.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_multiline_textformfield.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_show_manager_bottom_sheet.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class ProfileRequestAdvancePaymentView extends StatefulWidget {
  const ProfileRequestAdvancePaymentView({super.key});

  @override
  State<ProfileRequestAdvancePaymentView> createState() =>
      _ProfileRequestAdvancePaymentState();
}

class _ProfileRequestAdvancePaymentState
    extends BaseState<ProfileRequestAdvancePaymentView>
    with ProfileRequestAdvancePaymentMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Form(
        child: Padding(
          padding: const ProjectPadding.scaffold(),
          child: BlocProvider(
            create: (context) => profileRequestAdvancePaymentBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: CustomAutoSizeTextForTitle(
                    text: LocaleKeys
                        .profile_requests_request_advance_payment_advance_amount,
                  ),
                ),
                Container(
                  height: 52.h,
                  width: context.sized.width,
                  padding: const ProjectPadding.allXSmall().copyWith(top: 4).r,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorName.neutral200,
                    ),
                    borderRadius: ProjectBorderRadius.allCircleMedium(),
                  ),
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
                      prefix: Text(
                        '₺',
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                    controller: textEditingControllerAdvanceAmount,
                    onChanged:
                        profileRequestAdvancePaymentBloc.changePaymentAmount,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 24).r,
                  child: const CustomAutoSizeTextForTitle(
                    text:
                        LocaleKeys.profile_requests_request_permission_optional,
                  ),
                ),
                CustomMultilineTextFormField(
                  controller: textEditingControllerExplanation,
                ),
                const Spacer(
                  flex: 8,
                ),
                buildButton(context),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildButton(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: context.sized.width,
      child: BlocConsumer<ProfileRequestAdvancePaymentBloc,
          ProfileRequestAdvancePaymentState>(
        listener: (context, state) {
          if (state.paymentAmount != null) {
            profileRequestAdvancePaymentBloc.changeIsEnable(
              isEnable: true,
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              await buildShowModalSheet(context);
              await context.router.pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  state.isEnable ? ColorName.blueBase : ColorName.neutral200,
            ),
            child: AutoSizeText(
              LocaleKeys.profile_requests_request_advance_payment_button.tr(),
              style: textTheme.titleLarge!.copyWith(color: ColorName.neutral0),
            ),
          );
        },
      ),
    );
  }

  Future<Widget?> buildShowModalSheet(BuildContext context) {
    return showModalBottomSheet<Widget>(
      isScrollControlled: true,
      context: context,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CustomShowManagerBottomSheet();
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 72.h,
      leadingWidth: 80.w,
      surfaceTintColor: ColorName.neutral0,
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
      title: Column(
        children: [
          AutoSizeText(
            LocaleKeys.profile_requests_request_type_title.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AutoSizeText(
            LocaleKeys.profile_requests_request_type_request_to_advance_payment
                .tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: ColorName.neutral400),
          ),
        ],
      ),
    );
  }
}
