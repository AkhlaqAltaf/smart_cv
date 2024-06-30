import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/cv_resume/list_forms.dart';
import 'package:smart_cv/provider/cv_form_provider.dart';
import 'package:smart_cv/provider/data_providers/cv_resume_data_provider/personal_info_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class PersonalDetailForm extends StatefulWidget {
  const PersonalDetailForm({Key? key}) : super(key: key);

  @override
  State<PersonalDetailForm> createState() => _PersonalDetailFormState();
}

class _PersonalDetailFormState extends State<PersonalDetailForm> {
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

//
  late String _imageUrl;
  File? _image;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _imageUrl = '';
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  bool _inferenceInProgress = false;

  Future<void> getImage() async {
    if (_inferenceInProgress) return;
    _inferenceInProgress = true;

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
      _imageUrl = _image!.path;
    });
    _inferenceInProgress = false;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

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
                      TextFormField(
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => _selectDate(context),
                        decoration: InputDecoration(
                          hintText: 'Date Of Birth',
                          labelStyle: CustomTextStyles.bodyLargeGray800,
                          // Label text style
                          hintStyle: CustomTextStyles
                              .bodyLargeGray800, // Hint text style
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 20.v),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.h),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.calendar_today),
                          filled: true,
                        ),
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
                      multiDropdownSelector(context),
                      SizedBox(height: 20.v),
                      ElevatedButton(
                        onPressed: () async {
                          getImage();
                        },
                        child: const Text('Choose Image'),
                      ),
                      Text(
                        _imageUrl.isEmpty
                            ? 'No image selected'
                            : 'Image: $_imageUrl',
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
                          value.dateOfBirth = selectedDate;
                          value.imgUrl = _imageUrl;
                          value.submit_data();

                          Provider.of<CVFormProvider>(context, listen: false)
                              .form = forms_list[1];
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

  Widget multiDropdownSelector(BuildContext context) {
    PersonalInformationProvider provider =
        Provider.of<PersonalInformationProvider>(context, listen: false);
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
        print("SELECTED ...${options}");

        options.forEach((element) {
          if (!provider.selectedLanguages.contains(element.label)) {
            provider.selectedLanguages.add(element.label);
          }
        });
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
