import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/data_layer/invitation_card.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<List<InvitationCardData>> fetchInvitationCards(
    BuildContext context) async {
  String? id = await getUserId();
  try {
    final response = await http.get(Uri.parse('${get_invitation_cards}/$id'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<InvitationCardData> invitation_cards = [];
      print(jsonResponse.toString());
      jsonResponse.forEach((element) {
        InvitationCardData invitation_card =
            InvitationCardData.fromJson(element);
        invitation_cards.add(invitation_card);
      });

      print("COVER LETTERS : ${invitation_cards.toString()}");
      return invitation_cards;
    } else {
      displayError(context, "error", "Failed to load cover letters");

      throw Exception('Failed to load cover letters');
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return [];
  }
}
