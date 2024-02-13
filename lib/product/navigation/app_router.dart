import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/add_personnel_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/base_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view/create_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/create_password/view/success_created_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/forget_password/view/forget_password_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/login/view/login_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/onboard/view/onboard_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_success_view.dart';
import 'package:red_events_mobile_app_defult/feature/auth/sign_in/view/sign_in_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/bottom_navigation_bar_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/home_view.dart';
import 'package:red_events_mobile_app_defult/feature/home/view/qr_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_documents_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_education_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_notification_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_performance_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_progress_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_request_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_request_view_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/progress_payment_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/progress_payment_document_read_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_advance_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_leave_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_others_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_payroll_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_permission_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_report_view.dart';

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
        AutoRoute(page: ProfileEducationRoute.page),
        AutoRoute(page: ProfilePerformanceRoute.page),
        AutoRoute(page: ProfileRequestRoute.page),
        AutoRoute(page: ProfileRequestDetailRoute.page),
        AutoRoute(page: ProfileProgressPaymentRoute.page),
        AutoRoute(page: BottomNAvigationBarRoute.page, initial: true),
        AutoRoute(page: ProfileDocumentsRoute.page),
        AutoRoute(page: ProfileRequestPermissionRoute.page),
        AutoRoute(page: ProfileRequestAdvancePaymentRoute.page),
        AutoRoute(page: ProfileRequestReportRoute.page),
        AutoRoute(page: ProfileRequestLeaveRoute.page),
        AutoRoute(page: ProfileRequestOthersRoute.page),
        AutoRoute(page: QRCameraRoute.page),
        AutoRoute(page: ProfileRequestPayrollRoute.page),
        AutoRoute(page: ProgressPaymentDetailRoute.page),
        AutoRoute(page: ProgressPaymentDocumentReadRoute.page),
        AutoRoute(page: ProfileDetailRoute.page),
        AutoRoute(page: ProfileNotificationRoute.page),
      ];
}
