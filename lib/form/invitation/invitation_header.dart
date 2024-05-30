import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/form/invitation/event_detail.dart';
import 'package:smart_cv/form/invitation/host_detail.dart';
import 'package:smart_cv/form/invitation/message.dart';
import 'package:smart_cv/provider/invitation_card_form_provider.dart';

class InvitationHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.v),
          decoration: AppDecoration.gradientCyanToBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 9.v),
              SizedBox(height: 9.v),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumberedBadge(BuildContext context, Widget form, String text) {
    InvitatioonCardFormProvider invitationFormProvider =
        Provider.of<InvitatioonCardFormProvider>(context);
    return TextButton(
      onPressed: () {
        invitationFormProvider.form = form;
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
