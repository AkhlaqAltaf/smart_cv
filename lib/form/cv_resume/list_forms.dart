import 'package:flutter/material.dart';
import 'package:smart_cv/form/cv_resume/certification.dart';
import 'package:smart_cv/form/cv_resume/education.dart';
import 'package:smart_cv/form/cv_resume/personal.dart';
import 'package:smart_cv/form/cv_resume/skills.dart';
import 'package:smart_cv/form/cv_resume/work_experience.dart';

List<Widget> forms_list = [
  PersonalDetailForm(),
  EducationForm(),
  WorkExperienceForm(),
  CertificationAwardForm(),
    SkillForm(),

];
