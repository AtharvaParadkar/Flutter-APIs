import 'package:flutter_apis/get_api_categories_controller/get_api_categories_service.dart';
import 'package:flutter_apis/model/get_api_call_model.dart';
import 'package:get/get.dart';

class CategoryDetailController extends GetxController{
  // var categoryListMap = <CategoryModelListMap>[].obs;
  List<CategoryModelListMap> categoryListMap =[];
  var isLoading=true.obs;

  final CategoryDetailService _categoryDetailService=CategoryDetailService();

    @override
  void onInit() {
    fetchCategoryListMap();
    super.onInit();
  }

  fetchCategoryListMap()async{
    try{
      isLoading(true);
      categoryListMap=await _categoryDetailService.fetchCategoryListMap();
      update();
    }catch(e){
      print('error fetching categories $e');
    }finally{
      isLoading(false);
    }
  }
}
