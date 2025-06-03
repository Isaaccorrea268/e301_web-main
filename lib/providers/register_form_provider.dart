import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form Valid...Login');
      print('$email --- $password --- $name');
    } else {
      print('Form Not Valid');
    }
  }
}
