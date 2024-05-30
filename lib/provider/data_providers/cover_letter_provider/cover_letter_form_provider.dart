import 'package:flutter/material.dart';
import 'package:smart_cv/apis/cover_letters/create_cover_letter.dart';
import 'package:smart_cv/data_layer/cover_letter.dart';

class CoverLetterProvider extends ChangeNotifier {
  String _jobTitle = "";
  String _companyName = "";
  String _jobDescription = "";
  String _name = "";
  String _phoneNumber = "";
  String _email = "";
  String _address = "";
  String _experience = "";
  String get jobTitle => _jobTitle;
  String get companyName => _companyName;
  String get jobDescription => _jobDescription;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get email => _email;
  String get address => _address;
  String get experience => _experience;

  set jobTitle(String _) {
    this._jobTitle = _;
    notifyListeners();
  }

  set companyName(String _) {
    this._companyName = _;
    notifyListeners();
  }

  set jobDescription(String _) {
    this._jobDescription = _;
    notifyListeners();
  }

  set name(String _) {
    this._name = _;
    notifyListeners();
  }

  set phoneNumber(String _) {
    this._phoneNumber = _;
    notifyListeners();
  }

  set email(String _) {
    this._email = _;
    notifyListeners();
  }

  set address(String _) {
    this._address = _;
    notifyListeners();
  }

  set experience(String _) {
    this._experience = _;
    notifyListeners();
  }

  void onSubmit(BuildContext context) async {
    int user = 1;
    Fields field = Fields(
        user: user,
        job_title: this._jobTitle,
        company_name: this._companyName,
        job_description: this.jobDescription,
        name: this._name,
        phone_number: this._phoneNumber,
        email: this._email,
        address: this._address,
        experience: this.experience);
    await postCoverLetter(context, field);
  }
}
