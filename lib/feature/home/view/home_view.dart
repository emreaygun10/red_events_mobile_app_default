import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/home_view_mixin.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

part 'widget/home_app_bar.dart';

@RoutePage()

/// Home View
class HomeView extends StatefulWidget {
  // ignore: public_member_api_docs
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _HomeAppBar(),
      body: Column(
        children: [
          Assets.lottie.animZombie.lottie(package: 'gen'),
          const Text('Change Language'),
          Padding(
            padding: const ProjectPadding.allMedium(),
            child: ElevatedButton(
              onPressed: () {
                productViewModel.changeThemeMode(ThemeMode.dark);
                productViewModel.fToast.showToast(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.greenAccent,
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check),
                        SizedBox(
                          width: 12,
                        ),
                        Text('Tema değiştirildi !!'),
                      ],
                    ),
                  ),
                );
                // ProductLocalization.updateLanguage(
                //   context: context,
                //   value: Locales.en,
                // );
              },
              child: const Text(LocaleKeys.general_button_save).tr(),
            ),
          ),
        ],
      ),
    );
  }
}
