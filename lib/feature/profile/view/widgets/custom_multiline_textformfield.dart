// ignore_for_file: public_member_api_docs

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:widgets/widgets.dart';

class CustomMultilineTextFormField extends StatelessWidget {
  const CustomMultilineTextFormField({
    required TextEditingController controller,
    ValueChanged<String?>? valueChanged,
    super.key,
  })  : _controller = controller,
        _valueChanged = valueChanged;

  final TextEditingController _controller;
  final ValueChanged<String?>? _valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleMedium,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      onChanged: _valueChanged,
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: ProjectBorderRadius.allCircleMedium().r,
        ),
        hintText: LocaleKeys.profile_requests_request_permission_optional.tr(),
      ),
    );
  }
}
