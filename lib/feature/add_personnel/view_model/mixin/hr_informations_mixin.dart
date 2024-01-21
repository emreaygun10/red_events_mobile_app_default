import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/hr_informations_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/hr_information_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';
import 'package:red_events_mobile_app_defult/product/utility/enums/module_enum.dart';

mixin HrInformationMixin on BaseState<HrInformationView> {
  late final HrInformationCubit _hrInformationView;

  /// View Model Getter
  HrInformationCubit get hrInformationViewModel => _hrInformationView;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();

  /// Text editing controller nameSurname controller
  final TextEditingController nameSurnameEditingController =
      TextEditingController();

  /// Text editing controller tcNo  controller
  final TextEditingController tcNoEditingController = TextEditingController();

  /// Text editing controller birthDate controller
  final TextEditingController birthDateEditingController =
      TextEditingController();

  /// Currency items list
  final List<CustomCurrency> currencyList = <CustomCurrency>[
    CustomCurrency(
      currency: 'TRY',
      flag: Assets.icons.icTr.svg(package: ModuleEnum.gen.value),
    ),
    CustomCurrency(
      currency: 'EURO',
      flag: Assets.icons.icEu.svg(package: ModuleEnum.gen.value),
    ),
    CustomCurrency(
      currency: 'DOLLAR',
      flag: Assets.icons.icUs.svg(package: ModuleEnum.gen.value),
    ),
  ];

  final List<String> dummyItem = [
    'A_Item1',
    'A_Item2',
    'A_Item3',
    'A_Item4',
    'B_Item1',
    'B_Item2',
    'B_Item3',
    'B_Item4',
  ];

  /// Dropdown button search text controller
  TextEditingController textEditingController = TextEditingController();

  /// FormFocusNodes
  final List<FocusNode> focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _hrInformationView = HrInformationCubit();
    _hrInformationView.changeCurrencyValue(currencyList.first);
    for (final focusNode in focusNodes) {
      focusNode.addListener(() {
        hrInformationViewModel.changeFocusNodes(focusNodes);
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    for (final focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  /// jump page to page with PageView controller
}

class CustomCurrency {
  CustomCurrency({required this.currency, required this.flag});

  final String currency;
  final Widget flag;
}
