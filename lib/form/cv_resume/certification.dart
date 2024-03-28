import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class CertificationAwardForm extends StatefulWidget {
  @override
  _CertificationAwardFormState createState() => _CertificationAwardFormState();
}

class _CertificationAwardFormState extends State<CertificationAwardForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _issuerController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

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
                    'Certification / Award',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: _titleController,
                  hintText: 'Title',
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: _issuerController,
                  hintText: 'Issuer',
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  controller: _dateController,
                  hintText: 'Date',
                  textInputType: TextInputType.datetime,
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
            ))
      ]),
    );
  }

  void _saveCertificationAward() {
    String title = _titleController.text.trim();
    String issuer = _issuerController.text.trim();
    String date = _dateController.text.trim();

    // Validate input before saving
    if (title.isEmpty || issuer.isEmpty || date.isEmpty) {
      // Handle validation error
      return;
    }

    // Save certification/award data
    // Example: certificationAwardData.save(title, issuer, date);

    // Clear input fields after saving
    _titleController.clear();
    _issuerController.clear();
    _dateController.clear();
  }
}
