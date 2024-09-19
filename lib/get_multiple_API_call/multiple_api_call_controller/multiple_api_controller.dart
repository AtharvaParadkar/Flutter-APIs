import 'package:flutter_apis/get_multiple_API_call/model/multiple_api_call_model.dart';
import 'package:flutter_apis/get_multiple_API_call/multiple_api_call_controller/multiple_api_service.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController {
  var recipies = <RecipeModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes() async {
    try {
      isLoading(true);
      var recipeList = await RecipeService().fetchRecipes();
      if (recipeList.isNotEmpty) {
        recipies.addAll(recipeList);
      }
    } catch (e) {
      print('Error $e');
    } finally {
      isLoading(false);
    }
  }
}

class PostsController extends GetxController {
  var posts = <PostsModel>[].obs;
  var isLoading2 = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading2(true);
      var postsList = await PostsService().fetchPosts();
      if (postsList.isNotEmpty) {
        posts.addAll(postsList);
      }
    } catch (e) {
      print('Error $e');
    } finally {
      isLoading2(false);
    }
  }
}

class PostsTagController extends GetxController {
  var isLoading3 = true.obs;
  List<PostsTagModel> postsTagList = [];

  final PostsTagService _postsTagService = PostsTagService();

  @override
  void onInit() {
    fetchPostsTag();
    super.onInit();
  }

  fetchPostsTag() async {
    try {
      isLoading3(true);
      postsTagList = await _postsTagService.fetchPostsTag();
      update();
    } catch (c) {
      print('Error $c');
    } finally {
      isLoading3(false);
    }
  }
}
