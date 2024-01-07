import 'package:flutter/material.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view/documents_view.dart';
import 'package:red_events_mobile_app_defult/feature/add_personnel/view_model/add_personnel_view_model.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin DocumentsMixin on BaseState<DocumentsView> {
  late final AddPersonnelViewModel _addPersonnelViewModel;

  /// View Model Getter
  AddPersonnelViewModel get addPersonnelViewModel => _addPersonnelViewModel;

  /// Form Global Key
  final GlobalKey<FormState> formKey = GlobalKey();
}
