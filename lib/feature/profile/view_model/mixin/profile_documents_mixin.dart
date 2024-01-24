import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view/profile_documents_view.dart';
import 'package:red_events_mobile_app_defult/feature/profile/view_model/cubit/profile_documents_bloc.dart';
import 'package:red_events_mobile_app_defult/product/state/base/base_state.dart';

mixin ProfileDocumentsMixin on BaseState<ProfileDocumentsView> {
  late final ProfileDocumentsBloc _profileDocumentsBloc;

  /// View Model Getter
  ProfileDocumentsBloc get profileDocumentsBloc => _profileDocumentsBloc;

  @override
  void initState() {
    _profileDocumentsBloc = ProfileDocumentsBloc();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Hide Keyboard
  void hideKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// Select chip background color
  int? selectText(int index) {
    switch (index) {
      case 0:
        return null;
      default:
        return profileDocumentsBloc.state.missingDocumentsCounter;
    }
  }

  /// Select chip background color
  Color? selectChipBackgroundColor(int index) {
    switch (index) {
      case 0:
        return ColorName.greenBase;
      case 1:
        return ColorName.orangeBase;
      default:
        return ColorName.redBase;
    }
  }
}
