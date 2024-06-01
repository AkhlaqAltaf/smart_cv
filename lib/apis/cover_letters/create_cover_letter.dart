import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/cover_letter.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<bool> postCoverLetter(BuildContext context, Fields field) async {
  final String url = create_cover_letter;

  Map<String, dynamic>? data = field.toJson();

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
    if (response.statusCode < 300) {
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
