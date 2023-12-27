import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/sign_in_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view_model/state/sign_in_state.dart';
import 'package:widgets/widgets.dart';

/// Custom sign and login view text form field
class CustomTextFormField extends StatelessWidget {
  // ignore: public_member_api_docs
  const CustomTextFormField({
    required this.labelText,
    required this.signInViewModel,
    required this.leadingAsset,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    required this.isActive,
    super.key,
    this.trailingAssetFirst,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.trailingAssetSecond,
  });

  /// label string
  final String labelText;

  /// view model
  final SignInViewModel signInViewModel;

  /// leading widget
  final Widget leadingAsset;

  /// trailing first widget
  final Widget? trailingAssetFirst;

  /// trailing second widget
  final Widget? trailingAssetSecond;

  /// controller
  final TextEditingController textEditingController;

  /// focus node
  final FocusNode focusNode;

  ///Hint text
  final String hintText;

  /// AutoValidede mode default [AutovalidateMode.disabled]
  final AutovalidateMode autovalidateMode;

  /// trailing icon is active
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const ProjectPadding.onlyBottomSmall(),
          child: AutoSizeText(
            labelText,
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
                  controller: textEditingController,
                  autovalidateMode: autovalidateMode,
                  focusNode: focusNode,
                  obscureText: state.isObscure,
                  decoration: InputDecoration(
                    filled: focusNode.hasFocus,
                    hintText: hintText,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w100),
                    prefixIcon: Padding(
                      padding: const ProjectPadding.textFormFieldIcon().r,
                      child: GestureDetector(
                        child: leadingAsset,
                      ),
                    ),
                    suffixIcon: isActive
                        ? Padding(
                            padding: const ProjectPadding.textFormFieldIcon().r,
                            child: GestureDetector(
                              onTap: signInViewModel.changeObscure,
                              child: state.isObscure
                                  ? trailingAssetFirst
                                  : trailingAssetSecond,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
