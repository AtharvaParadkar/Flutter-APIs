import 'dart:convert';
import 'package:flutter_apis/get_multiple_API_call/model/multiple_api_call_model.dart';
import 'package:http/http.dart' as http;

class RecipeService{
  Future<List<RecipeModel>> fetchRecipes()async{
    final url=Uri.parse('https://dummyjson.com/recipes/tags');
    final response=await http.get(url);

    if(response.statusCode==200){
      List<dynamic>recipe=jsonDecode(response.body);
      return recipe.map((item)=>RecipeModel.fromJson(item)).toList();
    }else{
      throw Exception('Failed to Load Foods');
    }
  }
}
