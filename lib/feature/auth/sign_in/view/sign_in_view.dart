import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/mixin/sign_in_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/sign_in_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/state/sign_in_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/password_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_text_form_field.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_linear_gradient.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseState<SignInView> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signInViewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAuthAppBar(
          parentContext: context,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Flexible(
              flex: 3,
              child: buildTopStack(context),
            ),
            Flexible(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const ProjectPadding.scaffold().r,
                    child: buildSignInForm(context),
                  ),
                  Padding(
                    padding: const ProjectPadding.scaffold().r,
                    child: buildPasswordLevel(),
                  ),
                  buildBottomButtonAndTexts(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildBottomButtonAndTexts(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold().r,
      child: Column(
        children: [
          buildSignInButton(context),
          buildExistingAccountRow(context),
        ],
      ),
    );
  }

  Row buildExistingAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          LocaleKeys.sign_existing_account.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
          onPressed: () {},
          child: AutoSizeText(LocaleKeys.general_button_login.tr()),
        ),
      ],
    );
  }

  SizedBox buildSignInButton(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: context.sized.width,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.general_button_sign_in,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorName.neutral0),
        ).tr(),
      ),
    );
  }

  Form buildSignInForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildCompanyNameTextFormField(context),
          buildCompanyEmailTextFormField(context),
          buildCreatePasswordTextFormField(context, signInViewModel),
        ],
      ),
    );
  }

  SizedBox buildCreatePasswordTextFormField(
    BuildContext context,
    SignInViewModel signInViewModel,
  ) {
    return SizedBox(
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.onlyBottomSmall().r,
            child: SizedBox(
              height: 20.h,
              child: AutoSizeText(
                LocaleKeys.sign_create_password.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          BlocBuilder<SignInViewModel, SignInState>(
            builder: (context, state) {
              return SizedBox(
                height: 44.h,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorName.neutral200, width: 2),
                    borderRadius: ProjectBorderRadius.allCircleSmall().r,
                  ),
                  child: TextFormField(
                    onChanged: changePassword,
                    obscureText: state.isObscure,
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    focusNode: focusNodePassword,
                    style: Theme.of(context).textTheme.labelSmall,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: focusNodePassword.hasFocus,
                      contentPadding:
                          const ProjectPadding.textFormFieldPadding().r,
                      isDense: true,
                      prefixIcon: Padding(
                        padding: const ProjectPadding.textFormFieldIcon().r,
                        child: Assets.icons.icLock.svg(
                          package: ModuleEnum.gen.value,
                        ),
                      ),
                      hintText: '• • • • • • • • • •',
                      suffixIcon: Padding(
                        padding: const ProjectPadding.textFormFieldIcon().r,
                        child: GestureDetector(
                          onTap: signInViewModel.changeObscure,
                          child: state.isObscure
                              ? Assets.icons.icEye
                                  .svg(package: ModuleEnum.gen.value)
                              : Assets.icons.icEyeOff
                                  .svg(package: ModuleEnum.gen.value),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  BlocSelector<SignInViewModel, SignInState, SignInState> buildPasswordLevel() {
    final customW = (context.sized.width - 65.w) / 3;
    return BlocSelector<SignInViewModel, SignInState, SignInState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        return state.password.ext.isNotNullOrNoEmpty
            ? SizedBox(
                height: 106.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const ProjectPadding.symmetricSmallV().r,
                      child: Row(
                        children: [
                          Container(
                            height: 4.h,
                            width: customW.w,
                            color: state.passwordLevel == PasswordLevel.weak
                                ? Colors.red
                                : state.passwordLevel == PasswordLevel.middle
                                    ? ColorName.orangeBase
                                    : state.passwordLevel ==
                                            PasswordLevel.strong
                                        ? ColorName.greenBase
                                        : ColorName.neutral300,
                          ),
                          Padding(
                            padding: const ProjectPadding.symmetricXSmallH().r,
                            child: Container(
                              height: 4.h,
                              width: customW.w,
                              color: state.passwordLevel == PasswordLevel.middle
                                  ? ColorName.orangeBase
                                  : state.passwordLevel == PasswordLevel.strong
                                      ? ColorName.greenBase
                                      : ColorName.neutral300,
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: customW.w,
                            color: state.passwordLevel == PasswordLevel.strong
                                ? ColorName.greenBase
                                : ColorName.neutral300,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                      child: AutoSizeText(
                        '${state.passwordLevel.value.tr()}. ${LocaleKeys.sign_password_include_password.tr()} ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorName.neutral500),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: buildPasswordList(
                          context: context,
                          state: signInViewModel,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 106.h,
              );
      },
    );
  }

  List<Widget> buildPasswordList({
    required BuildContext context,
    required SignInViewModel state,
  }) {
    return [
      buildPasswordStrings(
        context: context,
        isCheck: state.isIncUpperLetter,
        title: LocaleKeys.sign_password_min_one_upper_letter,
      ),
      Padding(
        padding: const ProjectPadding.symmetricSmallV(),
        child: buildPasswordStrings(
          context: context,
          isCheck: state.isIncNum,
          title: LocaleKeys.sign_password_min_one_num,
        ),
      ),
      buildPasswordStrings(
        context: context,
        isCheck: state.isLengthBiggerThanEight,
        title: LocaleKeys.sign_password_password_size,
      ),
    ];
  }

  Row buildPasswordStrings({
    required BuildContext context,
    required bool isCheck,
    required String title,
  }) {
    return Row(
      children: [
        SizedBox(
          height: 16.h,
          width: 16.h,
          child: isCheck
              ? Assets.icons.icSelectBoxCircle
                  .svg(package: ModuleEnum.gen.value)
              : Assets.icons.icCloseCircle.svg(package: ModuleEnum.gen.value),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4).r,
          child: SizedBox(
            height: 16.h,
            child: AutoSizeText(
              title.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: ColorName.neutral500),
            ),
          ),
        ),
      ],
    );
  }

  Padding buildCompanyEmailTextFormField(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV().r,
      child: CustomTextFormField(
        textEditingController: companyMailController,
        focusNode: focusNodeCompanyMail,
        hintText: LocaleKeys.sign_hints_company_e_mail_hint.tr(),
        labelText: LocaleKeys.sign_company_e_mail.tr(),
        leadingAsset: Assets.icons.icMail.svg(package: ModuleEnum.gen.value),
      ),
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: const ProjectPadding.onlyBottomSmall(),
      //       child: AutoSizeText(
      //         LocaleKeys.sign_company_e_mail.tr(),
      //         style: Theme.of(context).textTheme.labelSmall,
      //       ),
      //     ),
      //     Container(
      //       decoration: BoxDecoration(
      //         border: Border.all(color: ColorName.neutral200, width: 2),
      //         borderRadius: ProjectBorderRadius.allCircleSmall().r,
      //       ),
      //       child: Padding(
      //         padding: const ProjectPadding.allXSmall(),
      //         child: TextFormField(
      //           controller: companyMailController,
      //           autovalidateMode: AutovalidateMode.disabled,
      //           focusNode: focusNodeCompanyMail,
      //           decoration: InputDecoration(
      //             filled: focusNodeCompanyMail.hasFocus,
      //             prefixIcon: Padding(
      //               padding: const ProjectPadding.textFormFieldIcon().r,
      //               child: Assets.icons.icMail.svg(
      //                 package: ModuleEnum.gen.value,
      //               ),
      //             ),
      //             hintText: LocaleKeys.sign_hints_company_e_mail_hint.tr(),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  CustomTextFormField buildCompanyNameTextFormField(BuildContext context) {
    return CustomTextFormField(
      textEditingController: companyNameController,
      focusNode: focusNodeCompanyName,
      hintText: LocaleKeys.sign_hints_company_name_hints.tr(),
      labelText: LocaleKeys.sign_company_name.tr(),
      leadingAsset: Assets.icons.icBuilding.svg(package: ModuleEnum.gen.value),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Padding(
    //       padding: const ProjectPadding.onlyBottomSmall(),
    //       child: AutoSizeText(
    //         LocaleKeys.sign_company_name.tr(),
    //         style: Theme.of(context).textTheme.labelSmall,
    //       ),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(
    //         border: Border.all(color: ColorName.neutral200, width: 2),
    //         borderRadius: ProjectBorderRadius.allCircleSmall().r,
    //       ),
    //       child: Padding(
    //         padding: const ProjectPadding.allXSmall(),
    //         child: TextFormField(
    //           controller: companyNameController,
    //           autovalidateMode: AutovalidateMode.disabled,
    //           focusNode: focusNodeCompanyName,
    //           decoration: InputDecoration(
    //             filled: focusNodeCompanyName.hasFocus,
    //             prefixIcon: Padding(
    //               padding: const ProjectPadding.textFormFieldIcon().r,
    //               child: Assets.icons.icBuilding.svg(
    //                 package: ModuleEnum.gen.value,
    //               ),
    //             ),
    //             hintText: LocaleKeys.sign_hints_company_name_hints.tr(),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }

  Stack buildTopStack(BuildContext context) {
    return Stack(
      children: [
        const BuildTopLinearGradient(),
        buildBaseTopTexts(context),
      ],
    );
  }

  SizedBox buildBaseTopTexts(BuildContext context) {
    return SizedBox(
      width: context.sized.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 127.h,
          ),
          buildTitle(context),
          buildTitleDesc(context),
        ],
      ),
    );
  }

  Padding buildTitleDesc(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricSmallV().r,
      child: SizedBox(
        width: 242.w,
        child: AutoSizeText(
          LocaleKeys.sign_sign_desc.tr(),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      LocaleKeys.general_button_sign_in.tr(),
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
