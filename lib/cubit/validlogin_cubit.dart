// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'validlogin_state.dart';

bool isValidEmail(String email) {
  // Simple email validation using a regular expression
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );
  return emailRegex.hasMatch(email);
}

bool Passcontrole(String password) {
  return password.length >= 6;
}

class ValidloginCubit extends Cubit<ValidloginState> {
  ValidloginCubit() : super(ValidloginInitial());
  final formKey = GlobalKey<FormState>();

  void Information(String Email, String Password) {
    // if (Email == "" || Password == "") {
    //   emit(loginFailure(Email: Email, Password: Password));
    // }

    //  else {
    //   emit(Validlogins(Email: Email, Password: Password));
    // }

    if (formKey.currentState != null &&
        formKey.currentState!.validate() &&
        isValidEmail(Email) &&
        Passcontrole(Password)) {
      emit(Validlogins(
        Email: Email,
        Password: Password,
      ));
    } else {
      emit(loginFailure(
        Email: Email,
        Password: Password,
      ));
    }
  }
}
