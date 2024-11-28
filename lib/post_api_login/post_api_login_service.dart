import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApiLoginService {
  static Future<bool> postUserEmailPhone(Map<String, dynamic> data) async {
    const String url = 'https://6746beb338c8741641d3ff54.mockapi.io/APIlogin';

    final headers = {'content-type': 'application/json'};

    try {
      print('Payload: $data');
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      print(
          'Response Status: ${response.statusCode}\n Response Code: ${response.body}');

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to submit data: ${response.body}');
        return false;
      }
    } catch (c) {
      print('Error in Post Service');
      return false;
    }
  }
}
