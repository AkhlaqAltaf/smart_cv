import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/provider/data_providers/cover_letter_provider/cover_letter_form_provider.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class CoverLetterForm extends StatefulWidget {
  @override
  _CoverLetterFormState createState() => _CoverLetterFormState();
}

class _CoverLetterFormState extends State<CoverLetterForm> {
  final _formKey = GlobalKey<FormState>();

  bool isSuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: customAppBar(
        context,
        "COVER LETTER FORM",
      ),
      body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Consumer<CoverLetterProvider>(
            builder: (context, value, child) => Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  CustomTextFormField(
                    initialText: value.jobTitle,
                    onChange: (_) {
                      value.jobTitle = _;
                    },
                    hintText: "Job Title",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the job title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.companyName,
                    onChange: (_) {
                      value.companyName = _;
                    },
                    hintText: "Company Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the company name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.name,
                    onChange: (_) {
                      value.name = _;
                    },
                    hintText: 'Your Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.phoneNumber,
                    onChange: (_) {
                      value.phoneNumber = _;
                    },
                    hintText: "Phone Number",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.email,
                    onChange: (_) {
                      value.email = _;
                    },
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.address,
                    onChange: (_) {
                      value.address = _;
                    },
                    hintText: "Address",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.jobDescription,
                    onChange: (_) {
                      value.jobDescription = _;
                    },
                    hintText: "Job Description",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the job description';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    initialText: value.experience,
                    onChange: (_) {
                      value.experience = _;
                    },
                    hintText: "Experience",
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    text: 'Submit',
                    onPressed: () async {
                      isSuccess = await value.onSubmit(context);
                      if (isSuccess) {
                        Navigator.of(context).pushNamed(AppRoutes.coverLetter);
                      }
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
