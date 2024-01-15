import 'package:auto_route/auto_route.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/add_personnel_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/base_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view/create_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view/success_created_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view/forget_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view/login_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view/onboard_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_success_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_education_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Project router information class
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OnboardRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SuccessSignInRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: CreatePasswordRoute.page),
        AutoRoute(page: SuccessCreatedPasswordRoute.page),
        AutoRoute(page: AddPersonnelRoute.page),
        AutoRoute(page: BaseInformationRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: ProfileEducationRoute.page, initial: true),
      ];
}
