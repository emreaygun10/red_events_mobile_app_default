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
    AddPersonnelFormRoute.name: (routeData) {
      return AutoRoutePage<PersonnelModel>(
        routeData: routeData,
        child: const AddPersonnelFormView(),
      );
    },
    AddPersonnelListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPersonnelListView(),
      );
    },
    AddPersonnelSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPersonnelSelectionView(),
      );
    },
    AddPersonnelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddPersonnelView(),
      );
    },
    AddShiftRoute.name: (routeData) {
      final args = routeData.argsAs<AddShiftRouteArgs>(
          orElse: () => const AddShiftRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddShiftView(
          key: args.key,
          title: args.title,
        ),
      );
    },
    BaseInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BaseInformationView(),
      );
    },
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BaseView(),
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
    HrRoute.name: (routeData) {
      final args =
          routeData.argsAs<HrRouteArgs>(orElse: () => const HrRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HrView(
          key: args.key,
          isEditMode: args.isEditMode,
          groupValue: args.groupValue,
          personnelList: args.personnelList,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    ManagerBottomNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ManagerBottomNavigationView(),
      );
    },
    OnboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardView(),
      );
    },
    OperationPersonnelListRoute.name: (routeData) {
      final args = routeData.argsAs<OperationPersonnelListRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperationPersonnelListView(
          operationType: args.operationType,
          key: args.key,
        ),
      );
    },
    PackageSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PackageSelectionView(),
      );
    },
    PersonnelSearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonnelSearchView(),
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
    PushFileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PushFileView(),
      );
    },
    PushNotificationRoute.name: (routeData) {
      final args = routeData.argsAs<PushNotificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PushNotificationView(
          list: args.list,
          key: args.key,
        ),
      );
    },
    QRCameraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QRCameraView(),
      );
    },
    ShiftDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShiftDetailView(),
      );
    },
    ShiftPermissionRoute.name: (routeData) {
      final args = routeData.argsAs<ShiftPermissionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ShiftPermissionView(
          fromTheView: args.fromTheView,
          key: args.key,
        ),
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
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessView(),
      );
    },
    WeaklyShiftDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeaklyShiftDetailView(),
      );
    },
    WeaklyShiftRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeaklyShiftView(),
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
/// [AddPersonnelFormView]
class AddPersonnelFormRoute extends PageRouteInfo<void> {
  const AddPersonnelFormRoute({List<PageRouteInfo>? children})
      : super(
          AddPersonnelFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonnelFormRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddPersonnelListView]
class AddPersonnelListRoute extends PageRouteInfo<void> {
  const AddPersonnelListRoute({List<PageRouteInfo>? children})
      : super(
          AddPersonnelListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonnelListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddPersonnelSelectionView]
class AddPersonnelSelectionRoute extends PageRouteInfo<void> {
  const AddPersonnelSelectionRoute({List<PageRouteInfo>? children})
      : super(
          AddPersonnelSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPersonnelSelectionRoute';

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
/// [AddShiftView]
class AddShiftRoute extends PageRouteInfo<AddShiftRouteArgs> {
  AddShiftRoute({
    Key? key,
    String title = LocaleKeys.manager_add_shift_title,
    List<PageRouteInfo>? children,
  }) : super(
          AddShiftRoute.name,
          args: AddShiftRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'AddShiftRoute';

  static const PageInfo<AddShiftRouteArgs> page =
      PageInfo<AddShiftRouteArgs>(name);
}

class AddShiftRouteArgs {
  const AddShiftRouteArgs({
    this.key,
    this.title = LocaleKeys.manager_add_shift_title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'AddShiftRouteArgs{key: $key, title: $title}';
  }
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
/// [BaseView]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

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
/// [HrView]
class HrRoute extends PageRouteInfo<HrRouteArgs> {
  HrRoute({
    Key? key,
    bool isEditMode = false,
    int groupValue = 0,
    List<PersonnelModel> personnelList = const [],
    List<PageRouteInfo>? children,
  }) : super(
          HrRoute.name,
          args: HrRouteArgs(
            key: key,
            isEditMode: isEditMode,
            groupValue: groupValue,
            personnelList: personnelList,
          ),
          initialChildren: children,
        );

  static const String name = 'HrRoute';

  static const PageInfo<HrRouteArgs> page = PageInfo<HrRouteArgs>(name);
}

class HrRouteArgs {
  const HrRouteArgs({
    this.key,
    this.isEditMode = false,
    this.groupValue = 0,
    this.personnelList = const [],
  });

  final Key? key;

  final bool isEditMode;

  final int groupValue;

  final List<PersonnelModel> personnelList;

  @override
  String toString() {
    return 'HrRouteArgs{key: $key, isEditMode: $isEditMode, groupValue: $groupValue, personnelList: $personnelList}';
  }
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
/// [ManagerBottomNavigationView]
class ManagerBottomNavigationRoute extends PageRouteInfo<void> {
  const ManagerBottomNavigationRoute({List<PageRouteInfo>? children})
      : super(
          ManagerBottomNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ManagerBottomNavigationRoute';

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
/// [OperationPersonnelListView]
class OperationPersonnelListRoute
    extends PageRouteInfo<OperationPersonnelListRouteArgs> {
  OperationPersonnelListRoute({
    required OperationsEnum operationType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OperationPersonnelListRoute.name,
          args: OperationPersonnelListRouteArgs(
            operationType: operationType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OperationPersonnelListRoute';

  static const PageInfo<OperationPersonnelListRouteArgs> page =
      PageInfo<OperationPersonnelListRouteArgs>(name);
}

class OperationPersonnelListRouteArgs {
  const OperationPersonnelListRouteArgs({
    required this.operationType,
    this.key,
  });

  final OperationsEnum operationType;

  final Key? key;

  @override
  String toString() {
    return 'OperationPersonnelListRouteArgs{operationType: $operationType, key: $key}';
  }
}

/// generated route for
/// [PackageSelectionView]
class PackageSelectionRoute extends PageRouteInfo<void> {
  const PackageSelectionRoute({List<PageRouteInfo>? children})
      : super(
          PackageSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PackageSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonnelSearchView]
class PersonnelSearchRoute extends PageRouteInfo<void> {
  const PersonnelSearchRoute({List<PageRouteInfo>? children})
      : super(
          PersonnelSearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonnelSearchRoute';

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
/// [PushFileView]
class PushFileRoute extends PageRouteInfo<void> {
  const PushFileRoute({List<PageRouteInfo>? children})
      : super(
          PushFileRoute.name,
          initialChildren: children,
        );

  static const String name = 'PushFileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PushNotificationView]
class PushNotificationRoute extends PageRouteInfo<PushNotificationRouteArgs> {
  PushNotificationRoute({
    required List<PersonnelModel> list,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PushNotificationRoute.name,
          args: PushNotificationRouteArgs(
            list: list,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PushNotificationRoute';

  static const PageInfo<PushNotificationRouteArgs> page =
      PageInfo<PushNotificationRouteArgs>(name);
}

class PushNotificationRouteArgs {
  const PushNotificationRouteArgs({
    required this.list,
    this.key,
  });

  final List<PersonnelModel> list;

  final Key? key;

  @override
  String toString() {
    return 'PushNotificationRouteArgs{list: $list, key: $key}';
  }
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
/// [ShiftDetailView]
class ShiftDetailRoute extends PageRouteInfo<void> {
  const ShiftDetailRoute({List<PageRouteInfo>? children})
      : super(
          ShiftDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShiftDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ShiftPermissionView]
class ShiftPermissionRoute extends PageRouteInfo<ShiftPermissionRouteArgs> {
  ShiftPermissionRoute({
    required FromTheView fromTheView,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ShiftPermissionRoute.name,
          args: ShiftPermissionRouteArgs(
            fromTheView: fromTheView,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ShiftPermissionRoute';

  static const PageInfo<ShiftPermissionRouteArgs> page =
      PageInfo<ShiftPermissionRouteArgs>(name);
}

class ShiftPermissionRouteArgs {
  const ShiftPermissionRouteArgs({
    required this.fromTheView,
    this.key,
  });

  final FromTheView fromTheView;

  final Key? key;

  @override
  String toString() {
    return 'ShiftPermissionRouteArgs{fromTheView: $fromTheView, key: $key}';
  }
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
/// [SuccessView]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeaklyShiftDetailView]
class WeaklyShiftDetailRoute extends PageRouteInfo<void> {
  const WeaklyShiftDetailRoute({List<PageRouteInfo>? children})
      : super(
          WeaklyShiftDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeaklyShiftDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeaklyShiftView]
class WeaklyShiftRoute extends PageRouteInfo<void> {
  const WeaklyShiftRoute({List<PageRouteInfo>? children})
      : super(
          WeaklyShiftRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeaklyShiftRoute';

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
