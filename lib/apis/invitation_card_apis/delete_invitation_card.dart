import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<void> deleteInvitationCard(BuildContext context, int id) async {
  try {
    final response = await http.delete(Uri.parse('${invitation_card}/$id/'));
    if (response.statusCode < 300) {
      displayError(context, "success", "Deleted");
    } else {
      displayError(context, "error", "Failed to Delete");

      return;
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return;
  }
}
