import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class HostDetailsForm extends StatefulWidget {
  @override
  _HostDetailsFormState createState() => _HostDetailsFormState();
}

class _HostDetailsFormState extends State<HostDetailsForm> {
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
                    'Host Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Enter Host Name',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Enter Host Email',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Enter Host Phone Number',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.number,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Enter Host Address',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
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
}