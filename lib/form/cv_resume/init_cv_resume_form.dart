import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';

class InitCVResumeForm extends StatefulWidget {
  const InitCVResumeForm({Key? key}) : super(key: key);

  @override
  State<InitCVResumeForm> createState() => _InitCVResumeFormState();
}

class _InitCVResumeFormState extends State<InitCVResumeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Column(
                children: [
                  Consumer<CVFormProvider>(
                    builder: (BuildContext context, form, Widget? child) {
                      return form.form;
                    },
                  ),
                ],
              ),
            ),
          ),
          // CvResumeHeader(),
        ],
      ),
    );
  }
}
