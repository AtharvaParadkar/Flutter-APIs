import 'dart:convert';
import 'package:flutter_apis/model/get_api_call_model.dart';
import 'package:http/http.dart' as https;

class CategoryService{
  Future<List<CategoryModel>> fetchCategories()async{
    final url=Uri.parse('https://dummyjson.com/products/category-list');
    final response = await https.get(url);

    if(response.statusCode==200){
      List<dynamic> data=jsonDecode(response.body);
      return data.map((item)=>CategoryModel.fromJson(item)).toList();
    }else{
      throw Exception('Failed to Load the Categories');
    }
  }
}