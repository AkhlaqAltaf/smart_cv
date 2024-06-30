import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<bool> postDataToServer(BuildContext context) async {
  final String url = create_cv;
  CvResume cvResume = CvResume.getInstance();
  print(cvResume.personalInformation?.toJson());
  print(
    cvResume.education?.toJson(),
  );
  print(
    cvResume.workExperience?.toJson(),
  );
  print(cvResume.certificationAward?.toJson());
  print(cvResume.skills.map((skill) => {'name': skill.name}).toList());

  Map<String, dynamic> data = {
    'personal_info': cvResume.personalInformation?.toJson(),
    'education': cvResume.education?.toJson(),
    'workExperience': cvResume.workExperience?.toJson(),
    'certification': cvResume.certificationAward?.toJson(),
    'skills': cvResume.skills.map((skill) => {'name': skill.name}).toList(),
    'prifile_picture': {"profile_pic": cvResume.personalInformation?.imgUrl}
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
      displayError(context, "success", 'SUCCESSFULLY UPLOADED');

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
