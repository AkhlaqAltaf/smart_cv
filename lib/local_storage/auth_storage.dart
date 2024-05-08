import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = await prefs.getString('token');
  return token;
}

Future<void> storeUser(String user) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', user);
}

Future<String?> getUser() async {
  final prefs = await SharedPreferences.getInstance();
  String? username = await prefs.getString('user');
  return username;
}

Future<void> clearData() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
