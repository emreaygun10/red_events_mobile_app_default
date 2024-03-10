import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

/// Custom sign and login view text form field
final class CustomTextFormField extends StatefulWidget {
  // ignore: public_member_api_docs
  const CustomTextFormField({
    required this.labelText,
    required this.leadingAsset,
    required this.textEditingController,
    required this.hintText,
    super.key,
    this.trailingAssetFirst,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.trailingAssetSecond,
    this.keyboardType = TextInputType.text,
    this.onChanged,
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

  ///Hint text
  final String hintText;

  /// keyboard type
  final TextInputType keyboardType;

  /// AutoValidede mode default [AutovalidateMode.disabled]
  final AutovalidateMode autovalidateMode;

  ///CustomOnChanged function
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends BaseState<CustomTextFormField> {
  late final FocusNode focusNode = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                widget.labelText.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          SizedBox(
            height: 44.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.neutral200, width: 2.r),
                borderRadius: ProjectBorderRadius.allCircleSmall().r,
              ),
              child: Padding(
                padding: const EdgeInsets.all(1).r,
                child: TextFormField(
                  focusNode: focusNode,
                  controller: widget.textEditingController,
                  autovalidateMode: widget.autovalidateMode,
                  style: Theme.of(context).textTheme.labelSmall,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                    fillColor: focusNode.hasFocus
                        ? ColorName.blueLighter
                        : ColorName.neutral0,
                    contentPadding:
                        const ProjectPadding.textFormFieldPadding().r,
                    isDense: true,
                    hintText: widget.hintText.tr(),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: ColorName.neutral500),
                    prefixIcon: Padding(
                      padding: const ProjectPadding.textFormFieldIcon().r,
                      child: GestureDetector(
                        child: widget.leadingAsset,
                      ),
                    ),
                  ),
                  onChanged: widget.onChanged,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
