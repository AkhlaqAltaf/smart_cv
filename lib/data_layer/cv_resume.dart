class CvResume {
  static CvResume? instance;
   PersonalInformation? personalInformation;
   WorkExperience? workExperience;
   List<Skill>? skills;
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
  List<String>? selectedLanguages;

  PersonalInformation({
    this.fullName,
    this.emailAddress,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.nationality,
    this.selectedLanguages,
  });
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
}

class CertificationAward {
  String? title;
  String? issuer;
  DateTime? date;

  CertificationAward(
    this.title,
    this.issuer,
    this.date,
  );
}
