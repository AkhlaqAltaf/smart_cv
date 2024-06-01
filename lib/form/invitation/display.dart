import 'package:flutter/material.dart';

import 'package:smart_cv/apis/invitation_card_apis/create_invitation_card.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/theme/custom_button_style.dart';
import 'package:smart_cv/widgets/custom_elevated_button.dart';

class InvitationCardDisplay extends StatefulWidget {
  const InvitationCardDisplay({Key? key}) : super(key: key);

  @override
  _InvitationCardDisplay createState() => _InvitationCardDisplay();
}

class _InvitationCardDisplay extends State<InvitationCardDisplay> {
  final InvitationCardData invitation = InvitationCardData.getInstance()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Host Detail:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Full Name: ${invitation.hostDetails?.hostName ?? ''}'),
            Text('Email Address: ${invitation.hostDetails?.hostEmail ?? ''}'),
            Text(
                'Phone Number: ${invitation.hostDetails?.hostPhoneNumber ?? ''}'),
            Text('Address: ${invitation.hostDetails?.hostAddress ?? ''}'),

            SizedBox(height: 20),
            Text(
              'Event Detail:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Event: ${invitation.eventDetails?.eventType ?? ''}'),
            Text('Location: ${invitation.eventDetails?.eventLocation ?? ''}'),
            Text('Date: ${invitation.eventDetails?.eventDate ?? ''}'),

            Text(
              'Messafe :',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Display education
            Text('Mesage: ${invitation.messageDetail?.messageText ?? ''}'),

            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.invitationCardCreate);
                },
                child: Text("Edit Data")),
            // Submit button            Spacer(),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  // Handle submit button press
                  // String? response = await postDataToServer();

                  bool isSuccess = await postInvitationCard(context);
                  if (isSuccess) {
                    Navigator.of(context).pushNamed(AppRoutes.invitationCard);
                  }
                },
                text: 'Submit Data',
                margin: EdgeInsets.only(left: 19.h, right: 22.h),
                buttonStyle: CustomButtonStyles.none,
                decoration: CustomButtonStyles.gradientPrimaryToTealDecoration,
              ),
            ),
          ],
        )));
  }
}
