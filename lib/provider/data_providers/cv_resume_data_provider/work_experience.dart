import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class ExperienceDataProvider extends ChangeNotifier {
  String? company;
  String? position;
  DateTime? startDate;
  String? endDate;
  String? responsibilities;

  void submit_data() {
    WorkExperience workExperience = WorkExperience(company, position,
        startDate.toString(), endDate.toString(), responsibilities);
    CvResume.getInstance().workExperience = workExperience;
  }
}
