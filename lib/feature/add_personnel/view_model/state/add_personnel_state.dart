// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:intl_phone_field/phone_number.dart';

final class AddPersonnelState extends Equatable {
  const AddPersonnelState({
    required this.isLoading,
    required this.isObscure,
    required this.nameSurnameFocus,
    required this.isImageSelected,
    required this.tcFocus,
    required this.birthDateFocus,
    required this.phoneNumberFocus,
    required this.cityFocus,
    required this.neighborhoodFocus,
    this.companyName,
    this.mail,
    this.password,
    this.imageFile,
    this.phoneNumber,
  });
  final bool isLoading;

  final bool isObscure;

  final String? companyName;

  final String? mail;

  final String? password;

  final bool nameSurnameFocus;

  final bool tcFocus;

  final bool birthDateFocus;

  final bool phoneNumberFocus;

  final bool cityFocus;

  final bool neighborhoodFocus;

  final File? imageFile;

  final bool isImageSelected;

  final PhoneNumber? phoneNumber;

  @override
  List<Object?> get props => [
        isLoading,
        isObscure,
        companyName,
        mail,
        password,
        nameSurnameFocus,
        imageFile,
        isImageSelected,
        nameSurnameFocus,
        tcFocus,
        birthDateFocus,
        phoneNumberFocus,
        cityFocus,
        neighborhoodFocus,
        phoneNumber,
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
    bool? nameSurnameFocus,
    bool? tcFocus,
    bool? birthDateFocus,
    bool? phoneNumberFocus,
    bool? cityFocus,
    bool? neighborhoodFocus,
    PhoneNumber? phoneNumber,
  }) {
    return AddPersonnelState(
      isLoading: isLoading ?? this.isLoading,
      isObscure: isObscure ?? this.isObscure,
      companyName: companyName ?? this.companyName,
      mail: mail ?? this.mail,
      password: password ?? this.password,
      nameSurnameFocus: passwordFocus ?? this.nameSurnameFocus,
      imageFile: imageFile ?? this.imageFile,
      isImageSelected: isImageSelected ?? this.isImageSelected,
      birthDateFocus: birthDateFocus ?? this.birthDateFocus,
      cityFocus: cityFocus ?? this.cityFocus,
      neighborhoodFocus: neighborhoodFocus ?? this.neighborhoodFocus,
      phoneNumberFocus: phoneNumberFocus ?? this.phoneNumberFocus,
      tcFocus: tcFocus ?? this.tcFocus,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
