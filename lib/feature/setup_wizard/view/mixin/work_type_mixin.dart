import 'package:red_events_mobile_app_defult/feature/setup_wizard/view/work_type_view.dart';
import 'package:red_events_mobile_app_defult/feature/setup_wizard/view_model/work_type_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin WorkTypeMixin on BaseState<WorkTypeView> {
  late final WorkTypeBloc workTypeBloc;
  final List<String> questionsOne = [
    'Alacak izni olarak hesapla',
    'Mesai ücreti ödenmez',
    'Mesai ücreti ödenir',
  ];
  final List<String> questionsTwo = [
    'Fazla saatler tek hesaplansın',
    'Fazla saatler 1,5 katı hesaplansın',
  ];
  final List<String> questionsThree = [
    'Tek hesaplansın',
    'Çift Hesaplansın',
  ];

  @override
  void initState() {
    workTypeBloc = WorkTypeBloc();
    super.initState();
  }
}
