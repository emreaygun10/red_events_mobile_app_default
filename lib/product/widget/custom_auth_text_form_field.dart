import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:widgets/widgets.dart';

/// Custom sign and login view text form field
class CustomTextFormField extends StatelessWidget {
  // ignore: public_member_api_docs
  const CustomTextFormField({
    required this.labelText,
    required this.leadingAsset,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    super.key,
    this.trailingAssetFirst,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.trailingAssetSecond,
    this.keyboardType = TextInputType.text,
  });

  /// label string
  final String labelText;

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

  final TextInputType keyboardType;

  /// AutoValidede mode default [AutovalidateMode.disabled]
  final AutovalidateMode autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const ProjectPadding.onlyBottomSmall(),
            child: SizedBox(
              height: 20.h,
              child: AutoSizeText(
                labelText,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          SizedBox(
            height: 44.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.neutral200, width: 2),
                borderRadius: ProjectBorderRadius.allCircleSmall().r,
              ),
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: TextFormField(
                  controller: textEditingController,
                  autovalidateMode: autovalidateMode,
                  focusNode: focusNode,
                  style: Theme.of(context).textTheme.labelSmall,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding:
                        const ProjectPadding.textFormFieldPadding().r,
                    isDense: true,
                    filled: focusNode.hasFocus,
                    hintText: hintText,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorName.neutral500),
                    prefixIcon: Padding(
                      padding: const ProjectPadding.textFormFieldIcon(),
                      child: GestureDetector(
                        child: leadingAsset,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
