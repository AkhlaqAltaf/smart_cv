import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<String?> postInvitationCard(BuildContext context, int user) async {
  final String url = create_cv;
  InvitationCard? invitation_card = InvitationCard.getInstance();

  Map<String, dynamic> data = {
    'host': invitation_card?.hostDetails?.toJson(),
    'event': invitation_card?.eventDetails?.toJson(),
    'message': invitation_card?.messageDetail?.toJson(),
    'user': user
  };

  String jsonData = jsonEncode(data);

  try {
    // Make a POST request to the server
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      String id = jsonDecode(response.body)['id'];
      displayError(context, "success", 'SUCCESSFULLY UPLOADED ${id}');

      return id;
    } else {
      displayError(context, "error", '${response.reasonPhrase}');
      return null;
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
  }
}
