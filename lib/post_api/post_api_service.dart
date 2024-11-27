import 'dart:convert';

import 'package:http/http.dart' as http;

class PostApiService {
  static Future<bool> postUserData(Map<String, String> data) async {
    const String url = 'https://6746beb338c8741641d3ff54.mockapi.io/APIex';

    final headers = {'content-type': 'application/json'};

    try {
      print('Payloar: $data');
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
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
