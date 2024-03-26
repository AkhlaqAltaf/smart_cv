import 'package:flutter/material.dart';
import 'package:smart_cv/form/cv_resume/header.dart';
import 'package:smart_cv/form/cv_resume/personal.dart';
import 'package:smart_cv/form/cv_resume/skills.dart';

class InitCVResumeForm extends StatefulWidget {
  const InitCVResumeForm({Key? key}) : super(key: key);

  @override
  State<InitCVResumeForm> createState() => _InitCVResumeFormState();
}

class _InitCVResumeFormState extends State<InitCVResumeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: PersonalDetailForm(),
          ),
          CvResumeHeader(),
        ],
      ),
    );
  }
}
