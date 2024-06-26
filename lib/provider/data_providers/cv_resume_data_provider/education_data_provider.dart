import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class EducationDataProvider extends ChangeNotifier {
  String? degree;
  String? fieldOfStudy;
  String? institution;
  String? location;
  String? graduationYear;

  void submit_data() {
    Education education = Education(
        degree, fieldOfStudy, institution, location, graduationYear.toString());

    CvResume.getInstance().education = education;
  }
}
