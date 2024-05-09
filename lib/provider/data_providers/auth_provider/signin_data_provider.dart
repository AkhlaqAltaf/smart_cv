import 'package:flutter/material.dart';
import 'package:smart_cv/apis/auth_apis/login.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';

class SignInDataProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";
  bool _isSuccess = false;

  String get email => _email;
  String get password => _password;
  bool get isSuccess => this._isSuccess;
  set email(String email) {
    this._email = email;
    notifyListeners();
  }

  set password(String password) {
    this._password = password;
    notifyListeners();
  }

  set isSuccess(bool isSuccess_) {
    this._isSuccess = isSuccess_;
    notifyListeners();
  }

  Future<bool> submit_data(BuildContext context) async {
    String? token = await loginUser(this._email, this._password, context);
    if (token == null) {
      return false;
    } else {
      await storeToken(token);
      await getToken();
      
      return true;
    }
  }
}
