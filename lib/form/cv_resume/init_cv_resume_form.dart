import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';

class InitCVResumeForm extends StatefulWidget {
  const InitCVResumeForm({Key? key}) : super(key: key);

  @override
  State<InitCVResumeForm> createState() => _InitCVResumeFormState();
}

class _InitCVResumeFormState extends State<InitCVResumeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: customAppBar(
        context,
        "CV RESUME FORM",
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
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
