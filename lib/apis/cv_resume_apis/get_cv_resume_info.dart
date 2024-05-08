import 'package:http/http.dart' as http;
import 'package:smart_cv/apis/urls/urls.dart';

Future<String?> getCVResumeInfo(id) async {
  try {
    final response = await http.get(
      Uri.parse(get_cv_info_url + id),
    );

    print("Response Status Code ${response.body}");

    if (response.statusCode == 200) {
      return "DATA";
    } else {
      // Authentication failed
      return "FAILED";
    }
  } catch (e) {
    print("ERRR $e");
  }
}
