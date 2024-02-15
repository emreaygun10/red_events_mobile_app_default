// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileNotificationState extends Equatable {
  const ProfileNotificationState({
    required this.chipIndex,
    required this.isLoading,
    required this.isLongPress,
    this.tempList,
    this.data,
  });
  final int chipIndex;
  final bool isLoading;
  final List<DataModel>? data;
  final List<DataModel>? tempList;
  final bool isLongPress;
  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        isLongPress,
        data,
        tempList,
      ];

  ProfileNotificationState copyWith({
    int? chipIndex,
    bool? isLoading,
    List<DataModel>? data,
    List<DataModel>? tempList,
    bool? isLongPress,
  }) {
    return ProfileNotificationState(
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      isLongPress: isLongPress ?? this.isLongPress,
      tempList: tempList ?? this.tempList,
    );
  }
}

class DataModel {
  DataModel({
    required this.title,
    required this.subTitle,
    required this.isCheck,
    required this.isRead,
  });

  final String title;
  final String subTitle;
  final bool isCheck;
  final bool isRead;

  DataModel copyWith({
    String? title,
    String? subTitle,
    bool? isCheck,
    bool? isRead,
  }) {
    return DataModel(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      isCheck: isCheck ?? this.isCheck,
      isRead: isRead ?? this.isRead,
    );
  }
}
