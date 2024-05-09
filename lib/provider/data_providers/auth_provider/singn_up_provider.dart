import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/apis/auth_apis/signup.dart';
import 'package:smart_cv/provider/data_providers/error_display_provider/error_provider.dart';

class SignUpDataProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _password2 = "";
  String _username = "";
  bool _isSuccess = false;

  String get email => _email;
  String get password => _password;
  String get password2 => _password2;
  String get username => _username;
  bool get isSuccess => this._isSuccess;

  set email(String email_) {
    this._email = email_;
    notifyListeners();
  }

  set password(String password_) {
    this._password = password_;
    notifyListeners();
  }

  set password2(String password2_) {
    this._password2 = password2_;
    notifyListeners();
  }

  set username(String username_) {
    this._username = username_;
    notifyListeners();
  }

  set isSuccess(bool isSuccess_) {
    this._isSuccess = isSuccess_;
    notifyListeners();
  }

  Future<bool?> submit_data(BuildContext context) async {
    print(password);
    print(password2);

    bool? isSub =
        await registerUser(username, email, password, password2, context);

    return isSub;
  }
}
