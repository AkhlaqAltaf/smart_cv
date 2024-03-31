import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/certification_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class CertificationAwardForm extends StatefulWidget {
  @override
  _CertificationAwardFormState createState() => _CertificationAwardFormState();
}

class _CertificationAwardFormState extends State<CertificationAwardForm> {

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
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
                            CustomTextFormField(
                              initialText: value.date,
                              onChange: (_value) {
                                value.date = _value as DateTime?;
                              },
                              hintText: 'Date',
                              textInputType: TextInputType.datetime,
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                    onPressed: () {
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
            ));
  }

}
