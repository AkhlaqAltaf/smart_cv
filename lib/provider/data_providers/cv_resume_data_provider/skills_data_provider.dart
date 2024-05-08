import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class SkillDataProvider extends ChangeNotifier {
  List<String> name = [];

  void submit_data() {
    print("DATA ${name}");
    CvResume? cvResume = CvResume.getInstance();
    name.forEach((element) {
      Skill skill = Skill(element);
      print("FOREACH");
      cvResume.skills.add(skill);
    });
  }
}
