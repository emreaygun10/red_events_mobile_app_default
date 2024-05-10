import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
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
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/bottom_sheet_views/push_file_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/bottom_sheet_views/push_notification_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/hr_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/view/personnel_search_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/add_personnel_daily_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/add_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/base_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/daily_views/add_personnel_daily_form_documents_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/daily_views/add_personnel_daily_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/operation_personnel_list_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shift_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/shift_permission_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/weakly_views/weakly_shift_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/shiftbox/view/weakly_views/weakly_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/manager/view/manager_bottom_navigation_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_documents_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_education_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_notification_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_performance_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_progress_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_request_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_request_view_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_shifts_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/progress_payment_detail_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/progress_payment_views/progress_payment_document_read_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_advance_payment_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_change_shift_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_leave_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_others_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_payroll_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_permission_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/profile_request_report_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/department_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/model/peronnel_model.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_department_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_department_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_form_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_list_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/add_personnel_selection_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/company_information_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/package_selection_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/success_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/welcome_wizard_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/work_type_view.dart';
import 'package:red_events_mobile_app_defult/product/init/language/locale_keys.g.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/shift_enum.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')

/// Project router information class
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        // ignore: avoid_redundant_argument_values
        AutoRoute(page: OnboardRoute.page, initial: kReleaseMode),
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
        AutoRoute(
          page: BottomNAvigationBarRoute.page,
        ), //kdebug
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
        AutoRoute(page: ProfileRequestChangeShiftRoute.page),
        AutoRoute(page: ProfileShiftsListRoute.page),
        AutoRoute(page: CompanyInformationRoute.page),
        AutoRoute(page: AddDepartmentRoute.page),
        AutoRoute(page: WelcomeWizardSetupRoute.page),
        AutoRoute(page: AddDepartmentFormRoute.page),
        AutoRoute(page: WorkTypeRoute.page),
        AutoRoute(
          page: AddPersonnelSelectionRoute.page,
        ),
        AutoRoute(page: AddPersonnelFormRoute.page),
        AutoRoute(page: AddPersonnelListRoute.page),
        AutoRoute(page: SuccessRoute.page),
        AutoRoute(page: ManagerBottomNavigationRoute.page, initial: kDebugMode),
        AutoRoute(page: PackageSelectionRoute.page),
        AutoRoute(page: HrRoute.page),
        AutoRoute(page: PersonnelSearchRoute.page),
        AutoRoute(page: PushNotificationRoute.page),
        AutoRoute(page: PushFileRoute.page),
        // AutoRoute(page: ShiftBoxRoute.page),
        AutoRoute(page: AddShiftRoute.page),
        AutoRoute(page: BaseRoute.page),
        AutoRoute(page: ShiftDetailRoute.page),
        AutoRoute(page: WeaklyShiftRoute.page),
        AutoRoute(page: WeaklyShiftDetailRoute.page),
        AutoRoute(
          page: ShiftPermissionRoute.page,
        ),
        AutoRoute(
          page: OperationPersonnelListRoute.page,
        ),
        AutoRoute(page: AddPersonnelDailyRoute.page),
        AutoRoute(page: AddPersonnelDailyFormRoute.page),
        AutoRoute(page: AddPersonnelDailyFormDocumentsRoute.page),
      ];
}
