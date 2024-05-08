import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/certification.dart';
import 'package:smart_cv/form/cv_resume/display.dart';
import 'package:smart_cv/form/cv_resume/education.dart';
import 'package:smart_cv/form/cv_resume/personal.dart';
import 'package:smart_cv/form/cv_resume/skills.dart';
import 'package:smart_cv/form/cv_resume/work_experience.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';

class CvResumeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.v),
          decoration: AppDecoration.gradientCyanToBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 9.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNumberedBadge(
                      context, PersonalDetailForm(), "Personal Information"),
                  _buildNumberedBadge(context, EducationForm(), "Education"),
                  _buildNumberedBadge(
                      context, WorkExperienceForm(), "Work Experience"),
                ],
              ),
              SizedBox(height: 9.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNumberedBadge(context, SkillForm(), "Skills"),
                  _buildNumberedBadge(context, CertificationAwardForm(),
                      "Certification And Award"),
                  _buildNumberedBadge(context, CvResumePage(), "Display"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberedBadge(BuildContext context, Widget form, String text) {
    final formProvider = Provider.of<CVFormProvider>(context);

    return TextButton(
      onPressed: () {
        formProvider.form = form;
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
