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
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseState<SignInView> with SignInMixin {
  @override
  Widget build(BuildContext context) {
    final customScrollViewSize =
        context.sized.height - MediaQuery.of(context).padding.top;
    return BlocProvider(
      create: (context) => signInViewModel,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAuthAppBar(
          parentContext: context,
        ),
        body: GestureDetector(
          onVerticalDragDown: (details) => hideKeyboard(),
          child: SingleChildScrollView(
            child: SizedBox(
              height: customScrollViewSize,
              child: Column(
                children: [
                  buildTopStack(context),
                  Padding(
                    padding: const ProjectPadding.scaffold(),
                    child: buildSignInForm(context),
                  ),
                  const Spacer(),
                  buildBottomButtonAndTexts(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildBottomButtonAndTexts(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.scaffold(),
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
      height: 56.h,
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
      child: Column(
        children: [
          buildCompanyNameTextFormField(context),
          buildCompanyEmailTextFormField(context),
          buildCreatePasswordTextFormField(context, signInViewModel),
        ],
      ),
    );
  }

  Column buildCreatePasswordTextFormField(
    BuildContext context,
    SignInViewModel signInViewModel,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.onlyBottomSmall(),
          child: AutoSizeText(
            LocaleKeys.sign_create_password.tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        BlocBuilder<SignInViewModel, SignInState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.neutral200, width: 2),
                borderRadius: ProjectBorderRadius.allCircleSmall().r,
              ),
              child: Padding(
                padding: const ProjectPadding.allXSmall(),
                child: TextFormField(
                  focusNode: focusNodePassword,
                  obscureText: state.isObscure,
                  decoration: InputDecoration(
                    filled: focusNodePassword.hasFocus,
                    hintText: '• • • • • • • • • •',
                    hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                    prefixIcon: Padding(
                      padding: const ProjectPadding.textFormFieldIcon().r,
                      child: GestureDetector(
                        child: Assets.icons.icLock.svg(
                          package: ModuleEnum.gen.value,
                        ),
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const ProjectPadding.textFormFieldIcon().r,
                      child: GestureDetector(
                        onTap: () => signInViewModel.changeObscure(),
                        child: state.isObscure
                            ? Assets.icons.icEye.svg(
                                package: ModuleEnum.gen.value,
                              )
                            : Assets.icons.icEyeOff.svg(
                                package: ModuleEnum.gen.value,
                                color: ColorName.neutral400,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Padding buildCompanyEmailTextFormField(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricLargeV(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.onlyBottomSmall(),
            child: AutoSizeText(
              LocaleKeys.sign_company_e_mail.tr(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorName.neutral200, width: 2),
              borderRadius: ProjectBorderRadius.allCircleSmall().r,
            ),
            child: Padding(
              padding: const ProjectPadding.allXSmall(),
              child: TextFormField(
                focusNode: focusNodeCompanyMail,
                decoration: InputDecoration(
                  filled: focusNodeCompanyMail.hasFocus,
                  prefixIcon: Padding(
                    padding: const ProjectPadding.textFormFieldIcon().r,
                    child: Assets.icons.icMail.svg(
                      package: ModuleEnum.gen.value,
                    ),
                  ),
                  hintText: LocaleKeys.sign_hints_company_e_mail_hint.tr(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column buildCompanyNameTextFormField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.onlyBottomSmall(),
          child: AutoSizeText(
            LocaleKeys.sign_company_name.tr(),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.neutral200, width: 2),
            borderRadius: ProjectBorderRadius.allCircleSmall().r,
          ),
          child: Padding(
            padding: const ProjectPadding.allXSmall(),
            child: TextFormField(
              focusNode: focusNodeCompanyName,
              decoration: InputDecoration(
                filled: focusNodeCompanyName.hasFocus,
                prefixIcon: Padding(
                  padding: const ProjectPadding.textFormFieldIcon().r,
                  child: Assets.icons.icBuilding.svg(
                    package: ModuleEnum.gen.value,
                  ),
                ),
                hintText: LocaleKeys.sign_hints_company_name_hints.tr(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Stack buildTopStack(BuildContext context) {
    return Stack(
      children: [
        buildTopLinearGradient(),
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
      padding: const ProjectPadding.symmetricSmallV(),
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

  Container buildTopLinearGradient() {
    return Container(
      height: 260.h,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            ColorName.blueBase,
            ColorName.blueLight.withOpacity(0),
          ],
          stops: const [
            0.2,
            1.0,
          ],
        ),
      ),
    );
  }
}
