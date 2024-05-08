class CvResume {
  static CvResume? instance;
  PersonalInformation? personalInformation;
  WorkExperience? workExperience;
  List<Skill> skills = [];
  Education? education;
  CertificationAward? certificationAward;

  static CvResume getInstance() {
    if (instance == null) {
      instance = CvResume();
    }
    return instance!;
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

  PersonalInformation({
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.nationality,
    this.selectedLanguages,
  });

  Map<String, dynamic>? toJson() {
    return {
      'full_name': fullName,
      'email': emailAddress,
      'phone_number': phoneNumber,
      'address': address,
      'date_of_birth': removeTimeFromDate(dateOfBirth!),
      'nationality': nationality,
      'languages': languages(selectedLanguages!),
      'user': 1,
    };
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
  int? graduationYear;

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
