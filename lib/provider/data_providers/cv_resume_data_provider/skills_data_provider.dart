import 'package:flutter/material.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';

class SkillDataProvider extends ChangeNotifier {
  List<TextEditingController> controllers = [];

  void addSkill() {
    controllers.add(TextEditingController());
    notifyListeners();
  }

  void removeSkill(int index) {
    controllers[index].dispose();
    controllers.removeAt(index);
    notifyListeners();
  }

  void updateSkills() {
    List<String> names =
        controllers.map((controller) => controller.text).toList();
    CvResume? cvResume = CvResume.getInstance();
    cvResume.skills.clear();
    names.forEach((element) {
      Skill skill = Skill(element);
      cvResume.skills.add(skill);
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
