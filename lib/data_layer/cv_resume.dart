import 'package:flutter/material.dart';
import 'package:smart_cv/presentation/vistor_screens/cv_resume_screen/cv_resume.dart';

class CvResume {
  static CvResume? instance;
  PersonalInformation? personalInformation;
  WorkExperience? workExperience;
  List<Skill> skills = [];
  Education? education;
  CertificationAward? certificationAward;
  int? id;
  String? created_on;
  String download = "";

  CvResume.data({
    this.id,
    this.created_on,
    this.personalInformation,
    this.education,
  });
  CvResume.instances();
  static CvResume getInstance() {
    if (instance == null) {
      instance = CvResume.instances();
    }
    return instance!;
  }

  factory CvResume.fromJson(Map<String, dynamic> json) {
    return CvResume.data(
      created_on: json['personal_info']['created_at'],
      id: json['id'],
      personalInformation: PersonalInformation.fromJson(json['personal_info']),
      education: Education.fromJson(json['education']),
    );
  }
}

class PersonalInformation {
  String? fullName;
  String? emailAddress;
  String? phoneNumber;
  String? address;
  String? dateOfBirth;
  String? nationality;
  List<String>? selectedLanguages = [];
  int? user;
  String? imgUrl;

  PersonalInformation(
      {this.fullName,
      this.emailAddress,
      this.phoneNumber,
      this.address,
      this.dateOfBirth,
      this.nationality,
      this.selectedLanguages,
      this.user,
      this.imgUrl});

  Map<String, dynamic>? toJson() {
    return {
      'full_name': fullName,
      'email': emailAddress,
      'phone_number': phoneNumber,
      'address': address,
      'date_of_birth': removeTimeFromDate(dateOfBirth!),
      'nationality': nationality,
      'languages': languages(selectedLanguages!),
      'user': this.user,
    };
  }

  factory PersonalInformation.fromJson(Map<String, dynamic> json) {
    return PersonalInformation(
        fullName: json['full_name'],
        phoneNumber: json['phone_number'],
        address: json['address'],
        nationality: json['nationality']);
  }

  List<Map<String, dynamic>> languages(List<String> languages) {
    List<Map<String, dynamic>> languageList = [];
    languages.forEach((language) {
      languageList.add({'name': language});
    });
    return languageList;
  }
}

class WorkExperience {
  String? company;
  String? position;
  String? startDate;
  String? endDate;
  String? responsibilities;

  WorkExperience(
    this.company,
    this.position,
    this.startDate,
    this.endDate,
    this.responsibilities,
  );

  Map<String, dynamic>? toJson() {
    return {
      'company': company,
      'position': position,
      'start_date': removeTimeFromDate(startDate!),
      'end_date': removeTimeFromDate(endDate!),
      'responsibilities': responsibilities,
    };
  }
}

class Skill {
  String? name;

  Skill(this.name);
}

class Education {
  String? degree;
  String? fieldOfStudy;
  String? institution;
  String? location;
  String? graduationYear;

  Education(
    this.degree,
    this.fieldOfStudy,
    this.institution,
    this.location,
    this.graduationYear,
  );

  Map<String, dynamic>? toJson() {
    return {
      'name': degree,
      'field_of_study': fieldOfStudy,
      'institute': institution,
      'location': location,
      'graduation_year': graduationYear.toString(),
    };
  }

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(json['name'], json['field_of_study'], json['institute'],
        json['location'], json['graduation_year']);
  }
}

class CertificationAward {
  String? title;
  String? issuer;
  String? date;

  CertificationAward(
    this.title,
    this.issuer,
    this.date,
  );

  Map<String, dynamic>? toJson() {
    return {
      'name': title,
      'issuer_name': issuer,
      'date': removeTimeFromDate(date!)
    };
  }
}

String removeTimeFromDate(String date) {
  int spaceIndex = date.indexOf(' ');

  if (spaceIndex != -1) {
    return date.substring(0, spaceIndex);
  } else {
    return date;
  }
}
