import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/work_experience.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class WorkExperienceForm extends StatefulWidget {
  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {


  @override
  Widget build(BuildContext context) {
    return Consumer<ExperienceDataProvider>(
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
                        "Work Experience",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      initialText: value.company,
                      onChange: (_value) {
                        value.company = _value;
                      },
                      hintText: 'Company',
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      initialText: value.position,
                      onChange: (_value) {
                        value.position = _value;
                      },
                      hintText: 'Position',
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            initialText: value.startDate,
                            onChange: (_value) {
                              value.startDate;
                            },
                            hintText: 'Start Date',
                            textInputType: TextInputType.datetime,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFormField(
                            initialText: value.endDate,
                            onChange: (_value) {
                              value.endDate = _value;
                            },
                            hintText: 'End Date',
                            textInputType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      initialText: value.responsibilities,
                      onChange: (_value) {
                        value.responsibilities;
                      },
                      hintText: 'Responsibilities',
                      maxLines: 3,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              value.submit_data();
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
                ),
              )
            ])));
  }

}
