import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class PersonalInformationProvider extends ChangeNotifier {
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;
  String? nationality;
  List<String> selectedLanguages = [];

  void submit_data() {
    print("LANGUAGES<<<<");
    print(selectedLanguages);
    CvResume cvResume = CvResume.getInstance();
    PersonalInformation personalInformation = PersonalInformation(
        fullName: fullName,
        address: address,
        emailAddress: emailAddress,
        dateOfBirth: dateOfBirth.toString(),
        nationality: nationality,
        phoneNumber: phoneNumber,
        selectedLanguages: selectedLanguages);

    cvResume.personalInformation = personalInformation;
  }
}
