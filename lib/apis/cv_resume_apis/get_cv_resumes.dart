import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/local_storage/auth_storage.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<List<CvResume>> fetchCVResumes(BuildContext context) async {
  String? userId = await getUserId();
  try {
    final response = await http.get(Uri.parse('${cv_resumes}/$userId'));
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<CvResume> cv_resumes = [];
      print(jsonResponse.toString());
      jsonResponse.forEach((element) {
        CvResume cv_resume = CvResume.fromJson(element);
        cv_resumes.add(cv_resume);
      });

      print("COVER LETTERS : ${cv_resumes.toString()}");
      return cv_resumes;
    } else {
      displayError(context, "error", "Failed to load cover letters");

      throw Exception('Failed to load cover letters');
    }
  } catch (e) {
    displayError(context, 'error', e.toString());
    return [];
  }
}
