import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/widgets/error_displayer.dart';
import 'package:open_filex/open_filex.dart';

Future<void> downloadCvResume(
    BuildContext context, int cvResumeId, String type) async {
  final String baseUrl = cv_resume;
  final String endpoint = '/download/$cvResumeId/$type';

  final Uri url = Uri.parse('$baseUrl$endpoint');

  try {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Directory? downloadDir = await getExternalStorageDirectory();
      String filePath = '${downloadDir!.path}/cv_resume_$cvResumeId.pdf';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      displayError(
          context, "success", 'CV resume downloaded successfully ${file}');
      await OpenFilex.open(filePath);
    } else {
      displayError(context, "error",
          'Failed to download CV resume. Status code: ${response.reasonPhrase}');
    }
  } catch (error) {
    displayError(context, "error", error.toString());
  }
}
