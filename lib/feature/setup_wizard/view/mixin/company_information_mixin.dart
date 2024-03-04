import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/company_information_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/company_information_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

mixin CompanyInformationMixin on BaseState<CompanyInformationView> {
  late final CompanyInformationBloc companyInformationBloc;
  late final SolidController solidController;
  int radioGroupValue = 0;
  bool isShow = false;
  int selectedPackage = 0;
  @override
  void initState() {
    companyInformationBloc = CompanyInformationBloc();
    solidController = SolidController();
    super.initState();
  }
}
