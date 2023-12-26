import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/model/onboard_model.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view_model/state/onboard_state.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_cubit.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';

/// Onboard state management class
class OnboardViewModel extends BaseCubit<OnboardState> {
  ///
  OnboardViewModel()
      : super(
          OnboardState(
            isLoading: false,
            onboardList: [
              OnboardModel(
                image: Assets.images.onboardOne.image(
                  package: ModuleEnum.gen.value,
                  fit: BoxFit.fitHeight,
                ),
                description: LocaleKeys.onboard_desc_one.tr(),
              ),
              OnboardModel(
                image: Assets.images.onboardTwo
                    .image(package: ModuleEnum.gen.value, fit: BoxFit.fill),
                description: LocaleKeys.onboard_desc_two.tr(),
              ),
              OnboardModel(
                image: Assets.images.onboardThree
                    .image(package: ModuleEnum.gen.value, fit: BoxFit.fill),
                description: LocaleKeys.onboard_desc_three.tr(),
              ),
            ],
          ),
        );

  ///set current index
  void changeCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
