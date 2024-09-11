import 'package:flutter_apis/get_api_call_controller/get_api_call_service.dart';
import 'package:flutter_apis/model/get_api_call_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[];
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async{
    try{
      isLoading(true);
      var categoryList=await CategoryService().fetchCategories();
      if(categoryList.isNotEmpty){
        categories.addAll(categoryList);
      }
    }catch(e){
      print('Error: $e');
    }finally{
      isLoading(false);
    }
  }
}
