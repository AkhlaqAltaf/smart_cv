import 'package:flutter/material.dart';
import 'package:smart_cv/form/invitation/event_detail.dart';

class InvitatioonCardFormProvider extends ChangeNotifier {
  Widget _form = EventDetailsForm();

  Widget get form => _form;

  set form(Widget form) {
    this._form = form;
    notifyListeners();
  }
}
