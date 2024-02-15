// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class CustomProfileDetailBottomSheetState extends Equatable {
  const CustomProfileDetailBottomSheetState({
    required this.sheetList,
    required this.isButtonEnable,
  });

  final List<BottomSheetModel> sheetList;
  final bool isButtonEnable;
  @override
  // TODO: implement props
  List<Object?> get props => [
        sheetList,
        isButtonEnable,
      ];

  CustomProfileDetailBottomSheetState copyWith({
    List<BottomSheetModel>? sheetList,
    bool? isButtonEnable,
  }) {
    return CustomProfileDetailBottomSheetState(
      isButtonEnable: isButtonEnable ?? this.isButtonEnable,
      sheetList: sheetList ?? this.sheetList,
    );
  }
}

class BottomSheetModel {
  BottomSheetModel({
    required this.id,
    required this.value,
    required this.title,
  });

  final int id;
  final bool value;
  final String title;

  BottomSheetModel copyWith({
    int? id,
    bool? value,
    String? title,
  }) {
    return BottomSheetModel(
      id: id ?? this.id,
      value: value ?? this.value,
      title: title ?? this.title,
    );
  }
}
