import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view_model/forget_password_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view_model/mixin/forget_password_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view_model/state/forget_password_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_text_form_field.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends BaseState<ForgetPasswordView>
    with ForgetPasswordMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAuthAppBar(
        parentContext: context,
      ),
      body: BlocProvider(
        create: (context) => forgetPasswordModelView,
        child: BlocBuilder<ForgetPasswordModelView, ForgetPasswordState>(
          builder: (context, state) {
            return forgetPasswordModelView.state.isSend
                ? buildVerificationMailCode(context)
                : buildEnterMailColumn(context);
          },
        ),
      ),
    );
  }

  Column buildEnterMailColumn(
    BuildContext context,
  ) {
    return Column(
      // padding: EdgeInsets.zero,
      // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        const CustomTopStack(
          title: LocaleKeys.forget_password_title,
          desc: LocaleKeys.forget_password_desc,
        ),
        const Spacer(),
        Padding(
          padding: const ProjectPadding.scaffold().r,
          child: buildLoginForm(context),
        ),
        const Spacer(
          flex: 7,
        ),
        Padding(
          padding: const ProjectPadding.symmetricNormalV(),
          child: buildForgetPasswordButton(
            context,
          ),
        ),
      ],
    );
  }

  Column buildVerificationMailCode(BuildContext context) {
    final otpStyles = [
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineMedium,
      Theme.of(context).textTheme.headlineMedium,
    ];
    return Column(
      children: [
        const CustomTopStack(
          title: LocaleKeys.forget_password_code_title,
          desc: LocaleKeys.forget_password_code_desc,
          descArgs: {'mail': 'emreaygun1157@gmail.com'},
        ),
        const Spacer(),
        buildOtpTextField(otpStyles),
        const Spacer(),
        buildTimerRow(context),
        const Spacer(
          flex: 7,
        ),
        buildVerificationButton(context),
      ],
    );
  }

  Padding buildVerificationButton(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets.bottom == 0
          ? const ProjectPadding.onlyBottomLarge().r
          : EdgeInsets.zero,
      child: SizedBox(
        height: 50.h,
        width: context.sized.width - 40.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: forgetPasswordModelView.state.isCompletedOtp
                ? ColorName.blueBase
                : ColorName.neutral200,
          ),
          onPressed: () {
            if (forgetPasswordModelView.state.isCompletedOtp) {
              /// TODO: SEND Code for verification
              context.router.push(const CreatePasswordRoute());
            } else {
              null;
            }
          },
          child: Text(
            LocaleKeys.forget_password_button_verification.tr(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }

  SizedBox buildTimerRow(BuildContext context) {
    return SizedBox(
      width: context.sized.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimer(),
          buildSendAgainText(context),
        ],
      ),
    );
  }

  TextButton buildSendAgainText(BuildContext context) {
    return TextButton(
      onPressed: reStartTimer,
      child: AutoSizeText(
        LocaleKeys.forget_password_button_send_again.tr(),
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: forgetPasswordModelView.state.second! > 0
                  ? ColorName.neutral400
                  : ColorName.blueDarker,
            ),
      ),
    );
  }

  SizedBox buildTimer() {
    return SizedBox(
      height: 20.h,
      width: 38.w,
      child: StreamBuilder<int>(
        stream: stopWatchTimer.secondTime,
        initialData: 0,
        builder: (context, snap) {
          setSecond(snap.data);
          return BlocBuilder<ForgetPasswordModelView, ForgetPasswordState>(
            builder: (context, state) {
              return AutoSizeText(
                '00:${state.second! > 0 ? state.second : '00'}',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: ColorName.neutral400),
              );
            },
          );
        },
      ),
    );
  }

  Padding buildOtpTextField(List<TextStyle?> otpStyles) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 64.h,
        width: context.sized.width,
        child: OtpTextField(
          numberOfFields: 6,
          borderColor: ColorName.neutral200,
          fieldWidth: context.sized.width / 8,
          showFieldAsBox: true,
          borderRadius: BorderRadius.circular(10),
          styles: otpStyles,

          focusedBorderColor: ColorName.blueBase,
          fillColor: ColorName.blueLighter,
          onCodeChanged: (String code) {
            print('box: $code');
            forgetPasswordModelView.changeIsCompletedOtp(false);
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            print('full code: $verificationCode');
            stopWatchTimer.onStopTimer();
            changeSetWatchSecond(0);

            forgetPasswordModelView.changeIsCompletedOtp(true);
          },
        ),
      ),
    );
  }

  Form buildLoginForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildCompanyNameTextFormField(context),
        ],
      ),
    );
  }

  CustomTextFormField buildCompanyNameTextFormField(BuildContext context) {
    return CustomTextFormField(
      textEditingController: mailController,
      hintText: LocaleKeys.sign_hints_company_e_mail_hint,
      labelText: LocaleKeys.sign_company_e_mail,
      leadingAsset: Assets.icons.icMail.svg(package: ModuleEnum.gen.value),
    );
  }

  Padding buildForgetPasswordButton(
    BuildContext context,
  ) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
      child: SizedBox(
        height: 50.h,
        width: context.sized.width,
        child: ElevatedButton(
          onPressed: () {
            /// TODO: SEND MESSAGE
            ///
            forgetPasswordModelView.changeIsSend();
          },
          child: AutoSizeText(
            LocaleKeys.forget_password_button_send_mail.tr(),
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorName.neutral0),
          ),
        ),
      ),
    );
  }
}
