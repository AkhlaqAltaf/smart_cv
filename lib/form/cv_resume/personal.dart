import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class PersonalDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // PersonalInformation personalInformation =
    //     CvResume.getInstance().personalInformation!;

    return Padding(
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
                      'Personal Inforrmation',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20.v),               
                  CustomTextFormField(
                  
                    controller: TextEditingController(),
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
                  multiDropdownSelector(),
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
        ));
  }

  Widget multiDropdownSelector() {
    MultiSelectController _controller = MultiSelectController();
    Map<String, String> languages =
        LocaleNamesLocalizationsDelegate.nativeLocaleNames;
    List<ValueItem> items = [];
    for (var language in languages.values) {
      items.add(ValueItem(label: language, value: language));
    }
    return MultiSelectDropDown(
      borderRadius: 20.h,
      controller: _controller,
      onOptionSelected: (options) {
        debugPrint(options.toString());
      },
      options: items,
      maxItems: 5,
      selectionType: SelectionType.multi,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),
    );
  }
}
