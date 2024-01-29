import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/home/wiew_model/mixin/home_view_mixin.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

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
    return const Scaffold(
      appBar: _HomeAppBar(),
      body: Center(
        child: AutoSizeText('Ana Sayfa'),
      ),
      // Column(
      //   children: [
      //     Assets.lottie.animZombie.lottie(package: 'gen'),
      //     Padding(
      //       padding: const ProjectPadding.allMedium(),
      //       child: ElevatedButton(
      //         onPressed: () {
      //           productViewModel.changeThemeMode();
      //           showSuccessToast('Home view success toast');
      //           // ProductLocalization.updateLanguage(
      //           //   context: context,
      //           //   value: Locales.en,
      //           // );
      //         },
      //         child: Text(
      //           LocaleKeys.general_button_save,
      //           style: Theme.of(context).textTheme.titleSmall,
      //         ).tr(),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
