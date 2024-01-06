// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:equatable/equatable.dart';

final class AddPersonnelState extends Equatable {
  const AddPersonnelState({
    required this.isLoading,
    required this.isObscure,
    required this.passwordFocus,
    required this.isImageSelected,
    this.companyName,
    this.mail,
    this.password,
    this.imageFile,
  });
  final bool isLoading;

  final bool isObscure;

  final String? companyName;

  final String? mail;

  final String? password;

  final bool passwordFocus;

  final File? imageFile;

  final bool isImageSelected;

  @override
  List<Object?> get props => [
        isLoading,
        isObscure,
        companyName,
        mail,
        password,
        passwordFocus,
        imageFile,
        isImageSelected,
      ];

  AddPersonnelState copyWith({
    bool? isLoading,
    bool? isObscure,
    String? companyName,
    String? mail,
    String? password,
    bool? passwordFocus,
    File? imageFile,
    bool? isImageSelected,
  }) {
    return AddPersonnelState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      companyName: companyName ?? this.companyName,
      mail: mail ?? this.mail,
      password: password ?? this.password,
      passwordFocus: passwordFocus ?? this.passwordFocus,
      imageFile: imageFile ?? this.imageFile,
      isImageSelected: isImageSelected ?? this.isImageSelected,
    );
  }
}
