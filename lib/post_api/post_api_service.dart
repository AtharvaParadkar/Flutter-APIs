import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApiService {
  static Future<bool> postUserData(Map<String, String> data) async {
    const String url = 'https://your-backend-url.com/api/post-data';

    final headers = {'content-type': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to submit data ${response.body}');
        return false;
      }
    } catch (c) {
      print('Error in Service $c');
      return false; 
    }
  }
}
