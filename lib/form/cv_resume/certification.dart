import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/list_forms.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/certification_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class CertificationAwardForm extends StatefulWidget {
  @override
  _CertificationAwardFormState createState() => _CertificationAwardFormState();
}

class _CertificationAwardFormState extends State<CertificationAwardForm> {
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  void dispose() {
    _dateController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Consumer<CertificationDataProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Certification / Award',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    initialText: value.title,
                    onChange: (_value) {
                      value.title = _value;
                    },
                    hintText: 'Title',
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    initialText: value.issuer,
                    onChange: (_value) {
                      value.issuer = _value;
                    },
                    hintText: 'Issuer',
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      hintText: 'Date',
                      labelStyle: CustomTextStyles.bodyLargeGray800,
                      // Label text style
                      hintStyle:
                          CustomTextStyles.bodyLargeGray800, // Hint text style
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<CVFormProvider>(context, listen: false)
                              .form = forms_list[2];
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.skip_previous,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Previous',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                           value.date = selectedDate;
                          value.submit_data();

                          // Provide selected date
                          print('Selected date: $selectedDate');

                          Provider.of<CVFormProvider>(context, listen: false)
                              .form = forms_list[4];
                        },
                        child: Row(
                          children: [
                            Text(
                              'Save & Next',
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.queue_play_next,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
