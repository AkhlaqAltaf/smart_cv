import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/provider/data_providers/invitation_card_data_provider/message_data_provider.dart';
import 'package:smart_cv/widgets/custom_text_form_field.dart';

class MessageDetailForm extends StatefulWidget {
  @override
  _MessageDetailFormState createState() => _MessageDetailFormState();
}

class _MessageDetailFormState extends State<MessageDetailForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MessageDataProvider>(
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
                        'Invitation Message',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      initialText: value.messageText,
                      onChange: (message) {
                        value.messageText = message;
                      },
                      hintText: 'Enter Event Location',
                      hintStyle: CustomTextStyles.bodyLargeGray800,
                      textInputType: TextInputType.text,
                      maxLines: 5,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 18.v),
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
                ),
              )
            ])));
  }
}
