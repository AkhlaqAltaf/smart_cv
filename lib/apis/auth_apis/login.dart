import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/signin_data_provider.dart';

import 'package:smart_cv/widgets/error_displayer.dart';

Future<String?> loginUser(
    String email, String password, BuildContext context) async {
  try {
    final response = await http.post(Uri.parse(login_url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'email': email,
            'password': password,
          },
        ));
    var decodedData = await jsonDecode(response.body);

    if (response.statusCode < 300) {
      String token = decodedData['token'];
      String userId = decodedData['user_id'].toString();

      await storeToken(token);
      await storeUserId(userId);

      displayError(context, "success", "SUCCESSFULLY SIGNED-IN");
      Provider.of<SignInDataProvider>(context, listen: false).isSuccess = true;

      return decodedData.toString();
    } else {
      displayError(context, 'error', "SOME ERROR ${response.statusCode}");

      return null;
    }
  } catch (e) {
    displayError(context, "error", e.toString());
    return null;
  }
}
