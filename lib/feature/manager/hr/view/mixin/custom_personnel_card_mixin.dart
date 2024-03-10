import 'package:red_events_mobile_app_defult/feature/manager/hr/view/widget/custom_personnel_card_widget.dart';
import 'package:red_events_mobile_app_defult/feature/manager/hr/viewmodel/personnel_card_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin CustomPersonnelCardMixin on BaseState<CustomPersonnelCardWidget> {
  late final PersonnelCardBloc personnelCardBloc;
  @override
  void initState() {
    personnelCardBloc = PersonnelCardBloc();

    personnelCardBloc.changePersonnelCard(widget.personnelModel);
    super.initState();
  }

  void onChanged(bool? value) {
    personnelCardBloc.changePersonnelCard(
      personnelCardBloc.state.personnelModel!.copyWith(isCheck: value ?? false),
    );
    if (widget.hrBloc != null) {
      widget.hrBloc!
          .addPersonnelSelectedList(personnelCardBloc.state.personnelModel!);
    }
  }
}
