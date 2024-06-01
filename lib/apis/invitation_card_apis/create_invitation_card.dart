import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<bool> postInvitationCard(BuildContext context) async {
  final String url = create_invitation_card;
  InvitationCardData? invitation_card = InvitationCardData.getInstance();
  print("INVITATION CARD${invitation_card?.eventDetails!.toJson()}");
  print("INVITATION CARD${invitation_card?.hostDetails!.toJson()}");

  print("INVITATION CARD${invitation_card?.messageDetail!.toJson()}");

  String? user = await getUserId();
  int userId = int.parse(user!);
  print("ID $userId");

  Map<String, dynamic> data = {
    'host': invitation_card?.hostDetails?.toJson(),
    'event': invitation_card?.eventDetails?.toJson(),
    'message': invitation_card?.messageDetail?.toJson(),
    'user': userId
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
    if (response.statusCode < 200) {
      displayError(context, "success", 'SUCCESSFULLY UPLOADED ');

      return true;
    } else {
      displayError(context, "error", '${response.reasonPhrase}');
      return false;
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return false;
  }
}
