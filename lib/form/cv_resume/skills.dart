import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/list_forms.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/skills_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class SkillForm extends StatefulWidget {
  @override
  _SkillFormState createState() => _SkillFormState();
}

class _SkillFormState extends State<SkillForm> {
  List<TextEditingController> controllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Consumer<SkillDataProvider>(
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
                          'Skills',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controllers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  onChange: (_value) {
                                    print("Changing..");
                                    value.name.insert(index, _value);
                                  },
                                  hintText: 'Full Name',
                                  hintStyle: CustomTextStyles.bodyLargeGray800,
                                  textInputType: TextInputType.text,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.h, vertical: 18.v),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    controllers.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            controllers.add(TextEditingController());
                          });
                        },
                        child: Text('Add Skill'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                Provider.of<CVFormProvider>(context,
                                        listen: false)
                                    .form = forms_list[3];
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
                                Navigator.pushNamed(
                                    context, AppRoutes.cvResumeDisplay);

                                // Provider.of<CVFormProvider>(context,listen: false).form =
                                //     forms_list[4];
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
            ])));
  }
}
