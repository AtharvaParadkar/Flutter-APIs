import 'dart:convert';
import 'package:flutter_apis/model/get_api_call_model.dart';
import 'package:http/http.dart' as http;

class CategoryDetailService {
  static const String _url = 'https://dummyjson.com/products/categories';

  Future<List<CategoryModelListMap>> fetchCategoryListMap() async {
    try {
      final responses = await http.get(Uri.parse(_url));

      if (responses.statusCode == 200) {
        List<dynamic> datas = jsonDecode(responses.body);
        return datas
            .map((item) => CategoryModelListMap.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to Load the Categories');
      }
    } catch (e) {
      throw Exception('Failed to Load the Categories: $e');
    }
  }
}
