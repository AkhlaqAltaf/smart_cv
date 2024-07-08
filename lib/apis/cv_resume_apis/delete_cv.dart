import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<void> deleteCvResume(BuildContext context, int id) async {
  try {
    final response = await http.delete(Uri.parse('${cv_resume}/${id}/'));
    if (response.statusCode < 300) {
      // Iterable jsonResponse = json.decode(response.body);
      displayError(context, "success", "Deleted");

      return null;
    } else {
      displayError(context, "error", "Failed to Delete");
      return null;
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return null;
  }
}
