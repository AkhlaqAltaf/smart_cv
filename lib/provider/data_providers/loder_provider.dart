import 'package:flutter/material.dart';

class LoaderProvider extends ChangeNotifier {
  bool _isLloading = false;

  bool get isLoading => _isLloading;

  set isLoading(bool isload) {
    this._isLloading = isload;
    print("IS LOADING TRUE HERE ........");
    notifyListeners();
  }
}
