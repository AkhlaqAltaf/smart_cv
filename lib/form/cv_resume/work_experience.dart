import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class WorkExperienceForm extends StatefulWidget {
  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  TextEditingController _companyController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _responsibilitiesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Work Experience",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: _companyController,
                  hintText: 'Company',
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: _positionController,
                  hintText: 'Position',
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _startDateController,
                        hintText: 'Start Date',
                        textInputType: TextInputType.datetime,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        controller: _endDateController,
                        hintText: 'End Date',
                        textInputType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: _responsibilitiesController,
                  hintText: 'Responsibilities',
                  maxLines: 3,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          // Handle previous button pressed
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
                          // Handle previous button pressed
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
        ]));
  }

  void _saveWorkExperience() {
    String company = _companyController.text.trim();
    String position = _positionController.text.trim();
    String startDate = _startDateController.text.trim();
    String endDate = _endDateController.text.trim();
    String responsibilities = _responsibilitiesController.text.trim();

    // Validate input before saving
    if (company.isEmpty ||
        position.isEmpty ||
        startDate.isEmpty ||
        endDate.isEmpty ||
        responsibilities.isEmpty) {
      // Handle validation error
      return;
    }

    // Save work experience data
    // Example: workExperienceData.save(company, position, startDate, endDate, responsibilities);

    // Clear input fields after saving
    _companyController.clear();
    _positionController.clear();
    _startDateController.clear();
    _endDateController.clear();
    _responsibilitiesController.clear();
  }
}
