import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/personal_info_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class PersonalDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Consumer<PersonalInformationProvider>(    
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
                          'Personal Inforrmation',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        
                        initialText: value.fullName,
                        onChange: (_value) {
                          value.fullName = _value;
                        },
                        hintText: 'Full Name',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        initialText: value.emailAddress,
                        onChange: (_value) {
                          value.emailAddress = _value;
                        },
                        hintText: 'Email Address',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.emailAddress,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        initialText: value.phoneNumber,
                        onChange: (_value) {
                          value.phoneNumber = _value;
                        },
                        hintText: 'Phone Number',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.phone,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        initialText: value.address,
                        onChange: (_value) {
                          value.address = _value;
                        },
                        hintText: 'Address',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.streetAddress,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        initialText: value.dateOfBirth,
                        onChange: (_value) {
                          value.dateOfBirth = _value;
                        },
                        hintText: 'Date of Birth',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.datetime,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
                      ),
                      SizedBox(height: 20.v),
                      CustomTextFormField(
                        initialText: value.nationality,
                        onChange: (_value) {
                          value.nationality = _value;
                        },
                        hintText: 'Nationality',
                        hintStyle: CustomTextStyles.bodyLargeGray800,
                        textInputType: TextInputType.text,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h, vertical: 18.v),
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
                SizedBox(height: 20.v),
              ],
            )));
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
