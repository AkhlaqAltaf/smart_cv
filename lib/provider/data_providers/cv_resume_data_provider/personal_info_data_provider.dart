import 'package:flutter/material.dart';

class PersonalInformationProvider extends ChangeNotifier {
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  String? dateOfBirth;
  String? nationality;
  List<String>? selectedLanguages;

  void submit_data() {
    print("Personal Information : $fullName");
    print("Personal Information : $nationality");
    // notifyListeners();
  }
}
