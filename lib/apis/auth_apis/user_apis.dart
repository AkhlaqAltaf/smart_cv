import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';
import 'package:smart_cv/local_storage/auth_storage.dart';

Future<bool> fetchUser(String token) async {
  print("TOKEN: $token");

  try {
    final response = await http.get(
      Uri.parse(get_user_url),
      headers: {
        'Authorization': 'TOKEN $token',
      },
    );

    if (response.statusCode == 200) {
      var decoded_data = jsonDecode(response.body);
      String username = decoded_data['username'];

      await storeUser(username);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
