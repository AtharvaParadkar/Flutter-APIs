import 'package:flutter_apis/get_products_api_call/get_products_api_controller/get_products_api_service.dart';
import 'package:flutter_apis/get_products_api_call/get_products_api_model/get_products_api_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  List<ProductsModel> productsList = [];

  final ProductsService _productsService = ProductsService();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      productsList = await _productsService.fetchProductsService();
      update();
    } catch (p) {
      print('Error - $p');
    }
  }
}
