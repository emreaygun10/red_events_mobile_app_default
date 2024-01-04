import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/login_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/mixin/login_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view_model/state/login_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_text_form_field.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
final class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAuthAppBar(
          parentContext: context,
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const CustomTopStack(
              title: LocaleKeys.login_title_text,
              desc: LocaleKeys.login_login_dec,
            ),
            SizedBox(
              height: 550.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const ProjectPadding.scaffold().r,
                    child: buildLoginForm(context),
                  ),
                  SizedBox(
                    height: 85.h,
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

  Form buildLoginForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          buildCompanyNameTextFormField(context),
          buildCompanyEmailTextFormField(context),
          buildCreatePasswordTextFormField(context, loginViewModel),
        ],
      ),
    );
  }

  SizedBox buildCreatePasswordTextFormField(
    BuildContext context,
    LoginViewModel signInViewModel,
  ) {
    return SizedBox(
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildPasswordLabelRow(context),
          BlocBuilder<LoginViewModel, LoginState>(
            builder: (context, state) {
              return SizedBox(
                height: 44.h,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorName.neutral200, width: 2),
                    borderRadius: ProjectBorderRadius.allCircleSmall().r,
                  ),
                  child: TextFormField(
                    focusNode: passwordFocusNode,
                    onChanged: changePassword,
                    obscureText: state.isObscure,
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: Theme.of(context).textTheme.labelSmall,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: passwordFocusNode.hasFocus
                          ? ColorName.blueLighter
                          : ColorName.neutral0,
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

  Padding buildPasswordLabelRow(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.onlyBottomSmall().r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildPasswordLabel(context),
          buildForgetPassword(context),
        ],
      ),
    );
  }

  SizedBox buildPasswordLabel(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: AutoSizeText(
        LocaleKeys.sign_create_password.tr(),
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }

  GestureDetector buildForgetPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const ForgetPasswordRoute());
      },
      child: SizedBox(
        height: 20.h,
        child: AutoSizeText(
          LocaleKeys.login_forget_password.tr(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }

  Padding buildCompanyEmailTextFormField(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV().r,
      child: CustomTextFormField(
        textEditingController: companyMailController,
        hintText: LocaleKeys.sign_hints_company_e_mail_hint.tr(),
        labelText: LocaleKeys.sign_company_e_mail.tr(),
        leadingAsset: Assets.icons.icMail.svg(package: ModuleEnum.gen.value),
      ),
    );
  }

  CustomTextFormField buildCompanyNameTextFormField(BuildContext context) {
    return CustomTextFormField(
      textEditingController: companyNameController,
      hintText: LocaleKeys.sign_hints_company_name_hints.tr(),
      labelText: LocaleKeys.sign_company_name.tr(),
      leadingAsset: Assets.icons.icBuilding.svg(package: ModuleEnum.gen.value),
      keyboardType: TextInputType.number,
    );
  }

  Padding buildBottomButtonAndTexts(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold().r,
      child: Column(
        children: [
          buildLoginButton(context),
          buildLoginAccountRow(context),
        ],
      ),
    );
  }

  Row buildLoginAccountRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          LocaleKeys.login_isRegistered.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton(
          onPressed: () {
            context.router.push(const SignInRoute());
          },
          child: AutoSizeText(
            LocaleKeys.general_button_create_account.tr(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: ColorName.blueBase),
          ),
        ),
      ],
    );
  }

  SizedBox buildLoginButton(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: context.sized.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16).r,
        ),
        onPressed: authenticate,
        child: AutoSizeText(
          LocaleKeys.general_button_login.tr(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorName.neutral0),
        ),
      ),
    );
  }

  // Stack buildTopStack(BuildContext context) {
  //   return Stack(
  //     children: [
  //       const BuildTopLinearGradient(),
  //       buildBaseTopTexts(context),
  //     ],
  //   );
  // }

  // SizedBox buildBaseTopTexts(BuildContext context) {
  //   return SizedBox(
  //     width: context.sized.width,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SizedBox(
  //           height: 127.h,
  //         ),
  //         buildTitle(context),
  //         buildTitleDesc(context),
  //       ],
  //     ),
  //   );
  // }

  // Padding buildTitleDesc(BuildContext context) {
  //   return Padding(
  //     padding: const ProjectPadding.symmetricSmallV().r,
  //     child: SizedBox(
  //       width: 242.w,
  //       child: AutoSizeText(
  //         LocaleKeys.login_login_dec.tr(),
  //         style: Theme.of(context).textTheme.bodySmall,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  // AutoSizeText buildTitle(BuildContext context) {
  //   return AutoSizeText(
  //     LocaleKeys.login_title_text.tr(),
  //     style: Theme.of(context)
  //         .textTheme
  //         .headlineLarge!
  //         .copyWith(fontWeight: FontWeight.bold),
  //   );
  // }
}
