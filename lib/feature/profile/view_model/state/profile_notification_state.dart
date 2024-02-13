// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';

final class ProfileNotificationState extends Equatable {
  const ProfileNotificationState({
    required this.chipIndex,
    required this.isLoading,
    required this.isLongPress,
    this.data,
  });
  final int chipIndex;
  final bool isLoading;
  final List<DataModel>? data;
  final bool isLongPress;
  @override
  List<Object?> get props => [
        chipIndex,
        isLoading,
        isLongPress,
        data,
      ];

  ProfileNotificationState copyWith({
    int? chipIndex,
    bool? isLoading,
    List<DataModel>? data,
    bool? isLongPress,
  }) {
    return ProfileNotificationState(
      chipIndex: chipIndex ?? this.chipIndex,
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      isLongPress: isLongPress ?? this.isLongPress,
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
