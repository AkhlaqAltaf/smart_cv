import 'package:flutter/material.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class PersonalDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Details',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Full Name',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Email Address',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.emailAddress,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Phone Number',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.phone,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Address',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.streetAddress,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Date of Birth',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.datetime,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Nationality',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
                CustomTextFormField(
                  hintText: 'Languages',
                  hintStyle: CustomTextStyles.bodyLargeGray800,
                  textInputType: TextInputType.text,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 18.v),
                ),
                SizedBox(height: 20.v),
              ],
            ),
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
          SizedBox(height: 20.v),
        ],
      ),
    );
  }
}
