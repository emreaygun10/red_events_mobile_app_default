// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddDepartmentFormRoute.name: (routeData) {
      return AutoRoutePage<DepartmentModel>(
        routeData: routeData,
        child: const AddDepartmentFormView(),
      );
    },
    AddDepartmentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddDepartmentView(),
      );
    },
    AddPersonnelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPersonnelView(),
      );
    },
    BaseInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BaseInformationView(),
      );
    },
    BottomNAvigationBarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BottomNAvigationBarView(),
      );
    },
    CompanyInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CompanyInformationView(),
      );
    },
    CreatePasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatePasswordView(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgetPasswordView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
    ProfileDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileDetailView(),
      );
    },
    ProfileDocumentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileDocumentsView(),
      );
    },
    ProfileEducationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileEducationView(),
      );
    },
    ProfileNotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileNotificationView(),
      );
    },
    ProfilePerformanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePerformanceView(),
      );
    },
    ProfileProgressPaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileProgressPaymentView(),
      );
    },
    ProfileRequestAdvancePaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestAdvancePaymentView(),
      );
    },
    ProfileRequestChangeShiftRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestChangeShiftView(),
      );
    },
    ProfileRequestDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRequestDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileRequestDetailView(
          permissionColor: args.permissionColor,
          iconColor: args.iconColor,
          key: args.key,
        ),
      );
    },
    ProfileRequestLeaveRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestLeaveView(),
      );
    },
    ProfileRequestOthersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestOthersView(),
      );
    },
    ProfileRequestPayrollRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestPayrollView(),
      );
    },
    ProfileRequestPermissionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestPermissionView(),
      );
    },
    ProfileRequestReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestReportView(),
      );
    },
    ProfileRequestRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileRequestView(),
      );
    },
    ProfileShiftsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileShiftsListView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileView(),
      );
    },
    ProgressPaymentDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProgressPaymentDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProgressPaymentDetailView(
          appBarTitle: args.appBarTitle,
          key: args.key,
        ),
      );
    },
    ProgressPaymentDocumentReadRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProgressPaymentDocumentReadView(),
      );
    },
    QRCameraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QRCameraView(),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInView(),
      );
    },
    SuccessCreatedPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessCreatedPasswordView(),
      );
    },
    SuccessSignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessSignInView(),
      );
    },
    WelcomeWizardSetupRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WelcomeWizardSetupView(),
      );
    },
    WorkTypeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WorkTypeView(),
      );
    },
  };
}

/// generated route for
/// [AddDepartmentFormView]
class AddDepartmentFormRoute extends PageRouteInfo<void> {
  const AddDepartmentFormRoute({List<PageRouteInfo>? children})
      : super(
          AddDepartmentFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDepartmentFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddDepartmentView]
class AddDepartmentRoute extends PageRouteInfo<void> {
  const AddDepartmentRoute({List<PageRouteInfo>? children})
      : super(
          AddDepartmentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddDepartmentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddPersonnelView]
class AddPersonnelRoute extends PageRouteInfo<void> {
  const AddPersonnelRoute({List<PageRouteInfo>? children})
      : super(
          AddPersonnelRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonnelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BaseInformationView]
class BaseInformationRoute extends PageRouteInfo<void> {
  const BaseInformationRoute({List<PageRouteInfo>? children})
      : super(
          BaseInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BottomNAvigationBarView]
class BottomNAvigationBarRoute extends PageRouteInfo<void> {
  const BottomNAvigationBarRoute({List<PageRouteInfo>? children})
      : super(
          BottomNAvigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNAvigationBarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CompanyInformationView]
class CompanyInformationRoute extends PageRouteInfo<void> {
  const CompanyInformationRoute({List<PageRouteInfo>? children})
      : super(
          CompanyInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CompanyInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatePasswordView]
class CreatePasswordRoute extends PageRouteInfo<void> {
  const CreatePasswordRoute({List<PageRouteInfo>? children})
      : super(
          CreatePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgetPasswordView]
class ForgetPasswordRoute extends PageRouteInfo<void> {
  const ForgetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardView]
class OnboardRoute extends PageRouteInfo<void> {
  const OnboardRoute({List<PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileDetailView]
class ProfileDetailRoute extends PageRouteInfo<void> {
  const ProfileDetailRoute({List<PageRouteInfo>? children})
      : super(
          ProfileDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileDocumentsView]
class ProfileDocumentsRoute extends PageRouteInfo<void> {
  const ProfileDocumentsRoute({List<PageRouteInfo>? children})
      : super(
          ProfileDocumentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDocumentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileEducationView]
class ProfileEducationRoute extends PageRouteInfo<void> {
  const ProfileEducationRoute({List<PageRouteInfo>? children})
      : super(
          ProfileEducationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileEducationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileNotificationView]
class ProfileNotificationRoute extends PageRouteInfo<void> {
  const ProfileNotificationRoute({List<PageRouteInfo>? children})
      : super(
          ProfileNotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePerformanceView]
class ProfilePerformanceRoute extends PageRouteInfo<void> {
  const ProfilePerformanceRoute({List<PageRouteInfo>? children})
      : super(
          ProfilePerformanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePerformanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileProgressPaymentView]
class ProfileProgressPaymentRoute extends PageRouteInfo<void> {
  const ProfileProgressPaymentRoute({List<PageRouteInfo>? children})
      : super(
          ProfileProgressPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileProgressPaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestAdvancePaymentView]
class ProfileRequestAdvancePaymentRoute extends PageRouteInfo<void> {
  const ProfileRequestAdvancePaymentRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestAdvancePaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestAdvancePaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestChangeShiftView]
class ProfileRequestChangeShiftRoute extends PageRouteInfo<void> {
  const ProfileRequestChangeShiftRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestChangeShiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestChangeShiftRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestDetailView]
class ProfileRequestDetailRoute
    extends PageRouteInfo<ProfileRequestDetailRouteArgs> {
  ProfileRequestDetailRoute({
    required Color permissionColor,
    required Color iconColor,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRequestDetailRoute.name,
          args: ProfileRequestDetailRouteArgs(
            permissionColor: permissionColor,
            iconColor: iconColor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRequestDetailRoute';

  static const PageInfo<ProfileRequestDetailRouteArgs> page =
      PageInfo<ProfileRequestDetailRouteArgs>(name);
}

class ProfileRequestDetailRouteArgs {
  const ProfileRequestDetailRouteArgs({
    required this.permissionColor,
    required this.iconColor,
    this.key,
  });

  final Color permissionColor;

  final Color iconColor;

  final Key? key;

  @override
  String toString() {
    return 'ProfileRequestDetailRouteArgs{permissionColor: $permissionColor, iconColor: $iconColor, key: $key}';
  }
}

/// generated route for
/// [ProfileRequestLeaveView]
class ProfileRequestLeaveRoute extends PageRouteInfo<void> {
  const ProfileRequestLeaveRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestLeaveRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestLeaveRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestOthersView]
class ProfileRequestOthersRoute extends PageRouteInfo<void> {
  const ProfileRequestOthersRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestOthersRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestOthersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestPayrollView]
class ProfileRequestPayrollRoute extends PageRouteInfo<void> {
  const ProfileRequestPayrollRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestPayrollRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestPayrollRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestPermissionView]
class ProfileRequestPermissionRoute extends PageRouteInfo<void> {
  const ProfileRequestPermissionRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestPermissionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestPermissionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestReportView]
class ProfileRequestReportRoute extends PageRouteInfo<void> {
  const ProfileRequestReportRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileRequestView]
class ProfileRequestRoute extends PageRouteInfo<void> {
  const ProfileRequestRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRequestRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileShiftsListView]
class ProfileShiftsListRoute extends PageRouteInfo<void> {
  const ProfileShiftsListRoute({List<PageRouteInfo>? children})
      : super(
          ProfileShiftsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileShiftsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileView]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProgressPaymentDetailView]
class ProgressPaymentDetailRoute
    extends PageRouteInfo<ProgressPaymentDetailRouteArgs> {
  ProgressPaymentDetailRoute({
    required String appBarTitle,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProgressPaymentDetailRoute.name,
          args: ProgressPaymentDetailRouteArgs(
            appBarTitle: appBarTitle,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProgressPaymentDetailRoute';

  static const PageInfo<ProgressPaymentDetailRouteArgs> page =
      PageInfo<ProgressPaymentDetailRouteArgs>(name);
}

class ProgressPaymentDetailRouteArgs {
  const ProgressPaymentDetailRouteArgs({
    required this.appBarTitle,
    this.key,
  });

  final String appBarTitle;

  final Key? key;

  @override
  String toString() {
    return 'ProgressPaymentDetailRouteArgs{appBarTitle: $appBarTitle, key: $key}';
  }
}

/// generated route for
/// [ProgressPaymentDocumentReadView]
class ProgressPaymentDocumentReadRoute extends PageRouteInfo<void> {
  const ProgressPaymentDocumentReadRoute({List<PageRouteInfo>? children})
      : super(
          ProgressPaymentDocumentReadRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProgressPaymentDocumentReadRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QRCameraView]
class QRCameraRoute extends PageRouteInfo<void> {
  const QRCameraRoute({List<PageRouteInfo>? children})
      : super(
          QRCameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'QRCameraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessCreatedPasswordView]
class SuccessCreatedPasswordRoute extends PageRouteInfo<void> {
  const SuccessCreatedPasswordRoute({List<PageRouteInfo>? children})
      : super(
          SuccessCreatedPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessCreatedPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessSignInView]
class SuccessSignInRoute extends PageRouteInfo<void> {
  const SuccessSignInRoute({List<PageRouteInfo>? children})
      : super(
          SuccessSignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessSignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WelcomeWizardSetupView]
class WelcomeWizardSetupRoute extends PageRouteInfo<void> {
  const WelcomeWizardSetupRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeWizardSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeWizardSetupRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WorkTypeView]
class WorkTypeRoute extends PageRouteInfo<void> {
  const WorkTypeRoute({List<PageRouteInfo>? children})
      : super(
          WorkTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkTypeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
