import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/data_layer/cv_resume.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<bool> postDataToServer(BuildContext context) async {
  final String url = create_cv;
  CvResume cvResume = CvResume.getInstance();

  print("IMAGE FILE ${cvResume.personalInformation!.imgUrl}");
  int id = await _uploadImage(cvResume.personalInformation!.imgUrl, context);

  Map<String, dynamic> data = {
    'personal_info': cvResume.personalInformation?.toJson(),
    'education': cvResume.education?.toJson(),
    'work_experience': cvResume.workExperience?.toJson(),
    'certification': cvResume.certificationAward?.toJson(),
    'skills': cvResume.skills.map((skill) => {'name': skill.name}).toList(),
    'body': "",
    'prifile_picture': id > 0 ? id : null
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
    if (response.statusCode < 300) {
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

Future<int> _uploadImage(image, BuildContext context) async {
  if (image == null) {
    displayError(context, "error", "NO IMAGE FILE");
    0;
  }

  var uri = Uri.parse(upload_image);
  var request = http.MultipartRequest("POST", uri);

  // Attach the file in the request
  request.files.add(await http.MultipartFile.fromPath(
    'profile_pic', // This should match the field name expected by the Django API
    image,
    filename: image,
  ));

  var response = await request.send();

  if (response.statusCode < 300) {
    var responseData = await http.Response.fromStream(response);
    var decodedData = jsonDecode(responseData.body);

    displayError(context, "success", "decoded: $decodedData");
    return decodedData['id'];
  } else {
    displayError(context, 'error', "STATUS CODE ERROR: ${response.statusCode}");
    return 0;
    print("Image upload failed with status code ${response.statusCode}");
  }
}
