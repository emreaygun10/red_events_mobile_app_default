import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view_model/create_password_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view_model/mixin/create_password_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view_model/state/create_password_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/navigation/app_router.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/password_enum.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_top_stack.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordView();
}

class _CreatePasswordView extends BaseState<CreatePasswordView>
    with CreatePasswordMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createPasswordViewModel,
      child: Scaffold(
        bottomNavigationBar: buildCreatePasswordButton(),
        extendBodyBehindAppBar: true,
        appBar: CustomAuthAppBar(parentContext: context),
        body: ListView(
          padding: EdgeInsets.zero,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const CustomTopStack(
              title: LocaleKeys.create_password_title,
              desc: LocaleKeys.create_password_desc,
            ),
            SizedBox(
              height: 34.h,
            ),
            Padding(
              padding: const ProjectPadding.scaffold(),
              child: buildCreatePasswordTextFormField(
                context: context,
                createPasswordViewModel: createPasswordViewModel,
                focusNode: passwordFocusNode,
                controller: passwordController,
                func: changePassword,
                labelString:
                    LocaleKeys.create_password_text_field_title_password_new,
                mainPassword: true,
              ),
            ),
            Padding(
              padding: const ProjectPadding.scaffold(),
              child: Visibility(
                visible:
                    createPasswordViewModel.state.password.ext.isNullOrEmpty,
                child: buildPasswordLevel(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Padding(
                padding: const ProjectPadding.scaffold(),
                child: buildCreatePasswordTextFormField(
                  context: context,
                  createPasswordViewModel: createPasswordViewModel,
                  focusNode: secondPasswordFocusNode,
                  controller: passwordControllerTwo,
                  labelString:
                      LocaleKeys.create_password_text_field_title_password,
                  mainPassword: false,
                  func: checkPasswordEqual,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCreatePasswordButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56, right: 20, left: 20).r,
      child: SizedBox(
        height: 56.h,
        child: BlocBuilder<CreatePasswordViewModel, CreatePasswordState>(
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                /// TODO: send api new password
                state.isPasswordsEqual ? print('şifreler eşit') : null;
                context.router.push(const SuccessCreatedPasswordRoute());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: state.isPasswordsEqual
                    ? ColorName.blueBase
                    : ColorName.neutral300,
              ),
              child: Text(
                LocaleKeys.general_button_create_password,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorName.neutral0),
              ).tr(),
            );
          },
        ),
      ),
    );
  }

  SizedBox buildCreatePasswordTextFormField({
    required BuildContext context,
    required CreatePasswordViewModel createPasswordViewModel,
    required String labelString,
    required TextEditingController controller,
    required FocusNode focusNode,
    required bool mainPassword,
    void Function(String value)? func,
  }) {
    return SizedBox(
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.onlyBottomXSmall().r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      labelString.tr(),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Visibility(
                      visible: !mainPassword,
                      child: AutoSizeText(
                        ' (${LocaleKeys.create_password_text_field_approve.tr()})',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              color: ColorName.neutral400,
                            ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    controller.text = '';
                    if (mainPassword) {
                      if (func != null) {
                        func('');
                      }
                    }
                  },
                  child: AutoSizeText(
                    LocaleKeys.general_button_clear.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(color: ColorName.blueDark),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<CreatePasswordViewModel, CreatePasswordState>(
            builder: (context, state) {
              return SizedBox(
                height: 48.h,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorName.neutral200, width: 2),
                    borderRadius: ProjectBorderRadius.allCircleSmall().r,
                  ),
                  child: TextFormField(
                    focusNode: focusNode,
                    onChanged: (value) {
                      if (func != null) {
                        func(value);
                      }
                    },
                    obscureText: state.isObscure,
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: Theme.of(context).textTheme.labelSmall,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      fillColor: focusNode.hasFocus
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
                          onTap: createPasswordViewModel.changeObscure,
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

  BlocSelector<CreatePasswordViewModel, CreatePasswordState,
      CreatePasswordState> buildPasswordLevel() {
    final customW = (context.sized.width - 65.w) / 3;
    return BlocSelector<CreatePasswordViewModel, CreatePasswordState,
        CreatePasswordState>(
      selector: (state) {
        return state;
      },
      builder: (context, state) {
        return Visibility(
          visible:
              createPasswordViewModel.state.password.ext.isNotNullOrNoEmpty,
          child: SizedBox(
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
                                : state.passwordLevel == PasswordLevel.strong
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
                      state: createPasswordViewModel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildPasswordList({
    required BuildContext context,
    required CreatePasswordViewModel state,
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
}
