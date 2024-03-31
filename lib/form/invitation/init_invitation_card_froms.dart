import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smart_cv/form/invitation/invitation_header.dart';
import 'package:smart_cv/provider/invitation_card_form_provider.dart';

class InitInvitationCardForm extends StatefulWidget {
  const InitInvitationCardForm({Key? key}) : super(key: key);

  @override
  State<InitInvitationCardForm> createState() => _InitInvitationCardForm();
}

class _InitInvitationCardForm extends State<InitInvitationCardForm> {
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
                  Consumer<InvitatioonCardFormProvider>(
                    builder: (context, value, child) => value.form,
                  )
                ],
              ),
            ),
          ),
          InvitationHeader(),
        ],
      ),
    );
  }
}
