import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/widgets/error_displayer.dart';
import 'package:open_filex/open_filex.dart';

Future<void> downloadInvitationCard(
    BuildContext context, int invitationID,type) async {
  final String baseUrl = invitation_card;
  final String endpoint = '/download/$invitationID/$type';

  final Uri url = Uri.parse('$baseUrl$endpoint');

  try {
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Directory? downloadDir = await getExternalStorageDirectory();
      String filePath =
          '${downloadDir!.path}/invitation_card_$invitationID.pdf';
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      displayError(
          context, "success", 'InvitationCard downloaded successfully ${file}');
      await OpenFilex.open(filePath);
    } else {
      displayError(context, "error",
          'Failed to download Invitation Card. Status code: ${response.reasonPhrase}');
    }
  } catch (error) {
    displayError(context, "error", error.toString());
  }
}
