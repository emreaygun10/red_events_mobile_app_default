import 'package:auto_route/auto_route.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view/onboard_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Project router information class
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: OnboardRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page),
      ];
}
