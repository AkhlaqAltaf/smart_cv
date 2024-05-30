import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/cover_letter.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<List<CoverLetterData>> fetchCoverLetters(
    BuildContext context, int id) async {
  try {
    final response = await http.get(Uri.parse('${get_cover_letters}/$id'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<CoverLetterData> coverLetters = [];
      print(jsonResponse.toString());
      jsonResponse.forEach((element) {
        CoverLetterData coverLetter = CoverLetterData.fromJson(element);
        coverLetters.add(coverLetter);
      });

      print("COVER LETTERS : ${coverLetters.toString()}");
      return coverLetters;
    } else {
      displayError(context, "error", "Failed to load cover letters");

      throw Exception('Failed to load cover letters');
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return [];
  }
}
