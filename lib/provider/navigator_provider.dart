import 'package:flutter/material.dart';

class NavigatorProvider extends ChangeNotifier {
  bool _isNavigate = false;

  bool get isNavigate => _isNavigate;

  set isNavigate(bool isNavigate_) {
    this._isNavigate = isNavigate_;
    notifyListeners();
  }
}
