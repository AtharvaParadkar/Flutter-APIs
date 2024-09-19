import 'package:flutter_apis/get_multiple_API_call/model/multiple_api_call_model.dart';
import 'package:flutter_apis/get_multiple_API_call/multiple_api_call_controller/multiple_api_service.dart';
import 'package:get/get.dart';

class RecipeController extends GetxController{
  var recipies=<RecipeModel>[].obs;
  var isLoading=true.obs;

  @override
  void onInit(){
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes() async{
    try{
      isLoading(true);
      var recipeList=await RecipeService().fetchRecipes();
      if(recipeList.isNotEmpty){
        recipies.addAll(recipeList);
      }
    }catch(e){
      print('Error $e');
    }finally{
      isLoading(false);
    }
  }
}