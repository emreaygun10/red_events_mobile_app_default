import 'package:kartal/kartal.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/request_views/cubit/profile_request_selection_manager_bloc.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/widgets/custom_payroll_request_select_manager.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileRequestSelectionManagerMixin
    on BaseState<CustomPayrollRequestSelectionBottomSheet> {
  late final ProfileRequestSelectionManagerBloc
      profileRequestSelectionManagerBloc;
  String? textBoxString;

  @override
  void initState() {
    profileRequestSelectionManagerBloc = ProfileRequestSelectionManagerBloc(
      managerList: [
        'Aydanur Evrener',
        'Emre Aygün',
        'Ellen Rose',
        'Jerome Bell',
        'Jerome Campel',
      ],
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: add managers list
    super.didChangeDependencies();
  }

  ///add manager
  void addManager(String manager) {
    final result = profileRequestSelectionManagerBloc.addManagerList(manager);
    if (result) {
      if (textBoxString.ext.isNullOrEmpty) {
        textBoxString = manager;
      } else {
        if (!textBoxString!.contains(manager)) {
          textBoxString = '$textBoxString - $manager';
        }
      }
    }
  }

  ///remove manager
  void removeManager(String manager) {
    profileRequestSelectionManagerBloc.removeManagerList(manager);
    if (textBoxString != null) {
      if (textBoxString!.contains('- $manager -')) {
        textBoxString = textBoxString!.replaceAll('- $manager -', '');
      } else if (textBoxString!.contains('- $manager')) {
        textBoxString = textBoxString!.replaceAll(' - $manager', '');
      } else if (textBoxString!.contains('$manager -')) {
        textBoxString = textBoxString!.replaceAll('$manager - ', '');
      } else if (textBoxString!.contains(manager)) {
        textBoxString = textBoxString!.replaceAll(manager, '');
      }
    }
  }
}
