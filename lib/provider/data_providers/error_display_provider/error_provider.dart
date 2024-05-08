import 'package:flutter/foundation.dart';

class ErrorProvider extends ChangeNotifier {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  set errorMessage(String? value) {
    _errorMessage = value;
    print("......................................................");
    notifyListeners();
  }

  void clearError() {
    errorMessage = null;
  }
}
