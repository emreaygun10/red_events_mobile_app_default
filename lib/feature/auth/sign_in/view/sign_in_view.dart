import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/widget/custom_auth_appbar.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends BaseState<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAuthAppBar(
        parentContext: context,
      ),
      body: Column(
        children: [
          buildTopStack(context),
          Padding(
            padding: const ProjectPadding.scaffold(),
            child: Form(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const ProjectPadding.onlyBottomSmall(),
                        child: AutoSizeText(
                          'Şirket Adı',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Şirket adını giriniz',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const ProjectPadding.symmetricLargeV(),
                    child: TextFormField(),
                  ),
                  TextFormField(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Stack buildTopStack(BuildContext context) {
    return Stack(
      children: [
        buildTopLinearGradient(),
        buildBaseTopTexts(context),
      ],
    );
  }

  SizedBox buildBaseTopTexts(BuildContext context) {
    return SizedBox(
      width: context.sized.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 127.h,
          ),
          buildTitle(context),
          buildTitleDesc(context),
        ],
      ),
    );
  }

  Padding buildTitleDesc(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.symmetricSmallV(),
      child: SizedBox(
        width: 242.w,
        child: AutoSizeText(
          LocaleKeys.sign_sign_desc.tr(),
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  AutoSizeText buildTitle(BuildContext context) {
    return AutoSizeText(
      LocaleKeys.general_button_sign_in.tr(),
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  Container buildTopLinearGradient() {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            ColorName.blueBase,
            ColorName.blueLight.withOpacity(0),
          ],
          stops: const [
            0.2,
            1.0,
          ],
        ),
      ),
    );
  }
}
