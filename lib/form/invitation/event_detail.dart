import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/invitation/form_list.dart';
import 'package:smart_cv/provider/data_providers/invitation_card_data_provider/events_detail_data_provider.dart';
import 'package:smart_cv/provider/invitation_card_form_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class EventDetailsForm extends StatefulWidget {
  @override
  _EventDetailsFormState createState() => _EventDetailsFormState();
}

class _EventDetailsFormState extends State<EventDetailsForm> {
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;
  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
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
    return Consumer<EventDetailsDataProvider>(
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
                        'Event Details',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      initialText: value.eventType,
                      onChange: (_value) {
                        value.eventType = _value;
                      },
                      hintText: 'Event Type',
                      hintStyle: CustomTextStyles.bodyLargeGray800,
                      textInputType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 18.v),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      initialText: value.eventDate,
                      onChange: (_value) {
                        value.eventDate = _value;
                      },
                      hintText: 'Enter Event Date',
                      hintStyle: CustomTextStyles.bodyLargeGray800,
                      textInputType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 18.v),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      initialText: value.eventTime,
                      onChange: (_value) {
                        value.eventTime = _value;
                      },
                      hintText: 'Enter Event Time',
                      hintStyle: CustomTextStyles.bodyLargeGray800,
                      textInputType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 18.v),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      initialText: value.eventLocation,
                      onChange: (_value) {
                        value.eventLocation = _value;
                      },
                      hintText: 'Enter Event Location',
                      hintStyle: CustomTextStyles.bodyLargeGray800,
                      textInputType: TextInputType.text,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 18.v),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              value.submit_data();
                              Provider.of<InvitatioonCardFormProvider>(context,
                                      listen: false)
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
                  ],
                ),
              )
            ])));
  }
}
