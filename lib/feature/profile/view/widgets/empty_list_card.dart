import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';
import 'package:widgets/widgets.dart';

class EmptyListWarning extends StatelessWidget {
  const EmptyListWarning({
    required this.textTheme,
    required this.chipText,
    super.key,
  });

  final TextTheme textTheme;
  final String chipText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 401.h,
      color: ColorName.neutral0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.icNullEducation.svg(package: ModuleEnum.gen.value),
            Padding(
              padding: const ProjectPadding.symmetricNormalV(),
              child: SizedBox(
                width: 182.w,
                child: AutoSizeText(
                  chipText,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
