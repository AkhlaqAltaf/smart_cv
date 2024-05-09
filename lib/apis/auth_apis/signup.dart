import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/provider/data_providers/auth_provider/singn_up_provider.dart';
import 'package:smart_cv/widgets/error_displayer.dart';

Future<bool?> registerUser(String username, String email, String password,
    String password2, BuildContext context) async {
  try {
    final response = await http.post(Uri.parse(register_url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          <String, dynamic>{
            'username': username,
            'email': email,
            'password': password,
            'password2': password2
          },
        ));
    var decodedData = await jsonDecode(response.body);

    if (response.statusCode == 200) {
      // String token = decodedData['token'];
      // await storeToken(token);
      displayError(context, "success", "USER SUCCESSFULLY REGISTER");
      Provider.of<SignUpDataProvider>(context, listen: false).isSuccess = true;

      return true;
    } else {
      displayError(context, 'error', "SOME ERROR ${response.statusCode}");

      return false;
    }
  } catch (e) {
    print("ERROR OCCUR IN CATCH >>>>");
    displayError(context, 'error', e.toString());
    return false;
  }
}
