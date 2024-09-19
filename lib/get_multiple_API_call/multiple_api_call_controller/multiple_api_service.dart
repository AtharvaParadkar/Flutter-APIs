import 'dart:convert';
import 'package:flutter_apis/get_multiple_API_call/model/multiple_api_call_model.dart';
import 'package:http/http.dart' as http;

class RecipeService {
  Future<List<RecipeModel>> fetchRecipes() async {
    final url = Uri.parse('https://dummyjson.com/recipes/tags');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> recipe = jsonDecode(response.body);
      return recipe.map((item) => RecipeModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to Load Foods');
    }
  }
}

class PostsService {
  Future<List<PostsModel>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/posts/tag-list'));

    if (response.statusCode == 200) {
      List<dynamic> post = jsonDecode(response.body);
      return post.map((po) => PostsModel.fromJson(po)).toList();
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}

class PostsTagService {
  static const String _url = 'https://dummyjson.com/posts/tags';

  Future<List<PostsTagModel>> fetchPostsTag() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        List<dynamic> tagposts = jsonDecode(response.body);
        return tagposts.map((tp) => PostsTagModel.fromJson(tp)).toList();
      } else {
        throw Exception('Failod to load Posts');
      }
    } catch (c) {
      throw Exception('Failed to load Posts $c');
    }
  }
}

class MoviesService{
  static const String _movieUrl='https://dummyapi.online/api/movies';

  Future<List<MoviesModel>> fetchMovies() async{
    try{
      final response = await http.get(Uri.parse(_movieUrl));

      if(response.statusCode==200){
        List<dynamic> movies = jsonDecode(response.body);
        return movies.map((mov)=>MoviesModel.fromJson(mov)).toList();
      }else{
        throw Exception('Failed to load movies');
      }
    }catch(m){
      throw Exception('Failed to Load Movies $m');
    }
  }
}