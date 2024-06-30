import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/list_forms.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/education_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class EducationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<EducationDataProvider>(
        builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Education',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      CustomTextFormField(
                        initialText: value.degree,
                        onChange: (_value) {
                          value.degree = _value;
                        },
                        hintText: 'Degree',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 18.0),
                      ),
                      SizedBox(height: 12.0),
                      CustomTextFormField(
                        initialText: value.fieldOfStudy,
                        onChange: (_value) {
                          value.fieldOfStudy = _value;
                        },
                        hintText: 'Field of Study',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 18.0),
                      ),
                      SizedBox(height: 12.0),
                      CustomTextFormField(
                        initialText: value.institution,
                        onChange: (_value) {
                          value.institution = _value;
                        },
                        hintText: 'University/Institution',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 18.0),
                      ),
                      SizedBox(height: 12.0),
                      CustomTextFormField(
                        initialText: value.location,
                        onChange: (_value) {
                          value.location = _value;
                        },
                        hintText: 'Location',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 18.0),
                      ),
                      SizedBox(height: 12.0),
                      CustomTextFormField(
                        initialText: value.graduationYear,
                        onChange: (_value) {
                          value.graduationYear = _value;
                        },
                        hintText: 'Graduation Year',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.number,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 18.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Provider.of<CVFormProvider>(context,
                                        listen: false)
                                    .form = forms_list[0];
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.skip_previous,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Previous',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              )),
                          TextButton(
                              onPressed: () {
                                value.submit_data();
                                Provider.of<CVFormProvider>(context,
                                        listen: false)
                                    .form = forms_list[2];
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Save & Next',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.queue_play_next,
                                    color: Colors.black,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ))
            ])));
  }
}
