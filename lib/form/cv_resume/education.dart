import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class EducationForm extends StatelessWidget {
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
                      'Education',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  CustomTextFormField(
                    hintText: 'Degree',
                    hintStyle: CustomTextStyles.bodyLargeGray800,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                  ),
                  SizedBox(height: 12.0),
                  CustomTextFormField(
                    hintText: 'Field of Study',
                    hintStyle: CustomTextStyles.bodyLargeGray800,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                  ),
                  SizedBox(height: 12.0),
                  CustomTextFormField(
                    hintText: 'University/Institution',
                    hintStyle: CustomTextStyles.bodyLargeGray800,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                  ),
                  SizedBox(height: 12.0),
                  CustomTextFormField(
                    hintText: 'Location',
                    hintStyle: CustomTextStyles.bodyLargeGray800,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
                  ),
                  SizedBox(height: 12.0),
                  CustomTextFormField(
                    hintText: 'Graduation Year',
                    hintStyle: CustomTextStyles.bodyLargeGray800,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
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
              ))
        ]));
  }
}
