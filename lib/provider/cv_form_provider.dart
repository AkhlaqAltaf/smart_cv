import 'package:flutter/material.dart';
import 'package:smart_cv/form/cv_resume/personal.dart';

class CVFormProvider extends ChangeNotifier {
  Widget _form = PersonalDetailForm();

  Widget get form => _form;

  set form(Widget form) {
    this._form = form;
    notifyListeners();
  }
}
