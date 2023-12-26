import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view_model/mixin/onboard_mixin.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view_model/onboard_view_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view_model/state/onboard_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends BaseState<OnboardView> with OnboardMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => onboardViewModel,
        child: Stack(
          children: [
            SizedBox(
              child: Stack(
                children: <Widget>[
                  buildOnboardImage(context, onboardViewModel),
                  buildTopLinearGradient(),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: context.sized.width,
                height: context.sized.height * 0.4,
                decoration: buildBottomLinerGradient(),
                child: Padding(
                  padding: const ProjectPadding.scaffold(),
                  child: Column(
                    verticalDirection: VerticalDirection.up,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildRegisterButton(context),
                            buildLoginButton(context),
                          ],
                        ),
                      ),
                      buildListViewPointer(),
                      buildOnboardDescription(context, onboardViewModel),
                      buildLogoColumn(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildLogoColumn(BuildContext context) {
    return Expanded(
      flex: 30,
      child: Column(
        children: [
          buildLogo(),
          buildLogoText(context),
        ],
      ),
    );
  }

  BoxDecoration buildBottomLinerGradient() {
    return const BoxDecoration(
      color: Colors.white,
      gradient: LinearGradient(
        begin: FractionalOffset.bottomCenter,
        end: FractionalOffset.topCenter,
        colors: [
          ColorName.blueBase,
          Colors.transparent,
        ],
        stops: [
          0.5,
          1.0,
        ],
      ),
    );
  }

  Container buildLogo() {
    return Container(
      width: 64,
      height: 64,
      decoration: ShapeDecoration(
        gradient: const RadialGradient(
          center: Alignment.bottomCenter,
          radius: 0,
          colors: [
            Color(0xFF002B41),
            Color(0xFF112331),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.80),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x33585C5F),
            blurRadius: 96,
            offset: Offset(0, 40),
            spreadRadius: -8,
          ),
        ],
      ),
    );
  }

  AutoSizeText buildLogoText(BuildContext context) {
    return AutoSizeText(
      LocaleKeys.onboard_productName.tr(),
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Expanded buildOnboardDescription(
    BuildContext context,
    OnboardViewModel onboardViewModel,
  ) {
    return Expanded(
      flex: 35,
      child: Padding(
        padding: const ProjectPadding.allLarge(),
        child: BlocBuilder<OnboardViewModel, OnboardState>(
          builder: (context, state) {
            return AutoSizeText(
              onboardViewModel.state
                  .onboardList[onboardViewModel.state.currentIndex].description,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorName.neutral0),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
    );
  }

  Expanded buildListViewPointer() {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return BlocBuilder<OnboardViewModel, OnboardState>(
            builder: (context, state) {
              return CircleAvatar(
                backgroundColor: index == state.currentIndex
                    ? ColorName.neutral0
                    : ColorName.blueDark,
              );
            },
          );
        },
      ),
    );
  }

  Expanded buildLoginButton(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
          ),
        ),
        child: AutoSizeText(
          LocaleKeys.general_button_login.tr(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorName.blueBase),
        ),
      ),
    );
  }

  Expanded buildRegisterButton(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
          ),
        ),
        child: AutoSizeText(
          LocaleKeys.general_button_sign_in.tr(),
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorName.blueBase),
        ),
      ),
    );
  }

  IgnorePointer buildTopLinearGradient() {
    return IgnorePointer(
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              ColorName.neutral900.withOpacity(0.8),
              Colors.transparent,
            ],
            stops: const [
              0.0,
              1.0,
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<OnboardViewModel, OnboardState> buildOnboardImage(
    BuildContext context,
    OnboardViewModel onboardViewModel,
  ) {
    return BlocBuilder<OnboardViewModel, OnboardState>(
      builder: (context, state) {
        return PageView.builder(
          itemCount: onboardViewModel.state.onboardList.length,
          itemBuilder: (context, index) {
            onboardViewModel.changeCurrentIndex(index);
            return Container(
              height: context.sized.height * 0.75,
              width: context.sized.width,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: onboardViewModel.state.onboardList[index].image,
            );
          },
        );
      },
    );
  }
}
