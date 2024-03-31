import 'package:flutter/material.dart';

class SignUpDataProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";


  String get email => _email;
  String get password => _password;
  set email(String email) {
    this._email = email;
    notifyListeners();
  }

  set password(String password) {
    this._password = password;
    notifyListeners();
  }

  String submit_data() {
    print("Email is..........  : ${this._email}");
    print("Password is.........  : ${this._password}");
    return "Success Message ...";
  }
}
