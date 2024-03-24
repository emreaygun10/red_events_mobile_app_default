import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_enforced_star.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AddShiftView extends StatefulWidget {
  const AddShiftView({super.key});

  @override
  State<AddShiftView> createState() => _AddShiftViewState();
}

class _AddShiftViewState extends BaseState<AddShiftView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          const Divider(),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      LocaleKeys.manager_add_shift_shift_info.tr(),
                      style: textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const CustomEnforcedStar(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: ColorName.neutral100,
      surfaceTintColor: Colors.transparent,
      title: AutoSizeText(
        LocaleKeys.manager_add_shift_title.tr(),
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
