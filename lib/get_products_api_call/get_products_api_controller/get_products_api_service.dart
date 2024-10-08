import 'dart:convert';

import 'package:flutter_apis/get_products_api_call/get_products_api_model/get_products_api_model.dart';
import 'package:http/http.dart' as http;

class ProductsService{
  static const String _productsUrl='https://fakestoreapiserver.reactbd.com/amazonproducts';

  Future<List<ProductsModel>> fetchProductsService() async{
    try{
      final res= await http.get(Uri.parse(_productsUrl));

      if(res.statusCode==200){
        List<dynamic> products=jsonDecode(res.body);
        return products.map((pro)=>ProductsModel.fromJson(pro)).toList();
      }else{
        throw Exception('Failed to show Products');
      }
    }catch(c){
      throw Exception('Failed $c');
    }
  }
}