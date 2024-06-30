import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/list_forms.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/work_experience.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class WorkExperienceForm extends StatefulWidget {
  @override
  _WorkExperienceFormState createState() => _WorkExperienceFormState();
}

class _WorkExperienceFormState extends State<WorkExperienceForm> {
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;
  TextEditingController _dateController2 = TextEditingController();
  DateTime? selectedDate2;

  @override
  void dispose() {
    _dateController.dispose();
    _dateController2.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2 ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
        _dateController2.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        hintText: 'Start Date',
                        labelStyle: CustomTextStyles.bodyLargeGray800,
                        // Label text style
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 20.v),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: Icon(Icons.calendar_today),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      onChanged: (_) {
                        value.endDate = _;
                      },
                      decoration: InputDecoration(
                        hintText: 'End Date (Optioal)',

                        labelStyle: CustomTextStyles.bodyLargeGray800,
                        // Label text style
                        hintStyle: CustomTextStyles
                            .bodyLargeGray800, // Hint text style
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 20.v),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.h),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextFormField(
                      initialText: value.responsibilities,
                      onChange: (_value) {
                        value.responsibilities = _value;
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
                              Provider.of<CVFormProvider>(context,
                                      listen: false)
                                  .form = forms_list[1];
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
                              value.startDate = selectedDate;
                              value.submit_data();
                              Provider.of<CVFormProvider>(context,
                                      listen: false)
                                  .form = forms_list[3];
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
