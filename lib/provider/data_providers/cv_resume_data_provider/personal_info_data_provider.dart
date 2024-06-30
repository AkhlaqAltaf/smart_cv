import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';

class PersonalInformationProvider extends ChangeNotifier {
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;
  String? nationality;
  List<String> selectedLanguages = [];
  String? imgUrl;

  void submit_data() async {
    print("LANGUAGES<<<<");
    print(selectedLanguages);
    String? user = await getUserId();
    CvResume cvResume = CvResume.getInstance();

    PersonalInformation personalInformation = PersonalInformation(
        fullName: fullName,
        address: address,
        emailAddress: emailAddress,
        dateOfBirth: dateOfBirth.toString(),
        nationality: nationality,
        phoneNumber: phoneNumber,
        selectedLanguages: selectedLanguages,
        user: int.parse(user!),
        imgUrl: imgUrl);

    cvResume.personalInformation = personalInformation;
  }
}
