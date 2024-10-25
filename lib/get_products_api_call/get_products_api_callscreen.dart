import 'package:flutter/material.dart';
import 'package:flutter_apis/get_products_api_call/get_products_api_controller/get_products_api_controller.dart';
import 'package:flutter_apis/get_products_api_call/get_products_api_model/get_products_api_model.dart';
import 'package:get/get.dart';

class GetProductsApiCallscreen extends StatelessWidget {
  GetProductsApiCallscreen({super.key});

  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products APi'),
      ),
      body: GetBuilder<ProductsController>(
        init: productsController,
        builder: (controller) {
          return controller.productsList.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.productsList.length,
                  itemBuilder: (ctx, i) {
                    ProductsModel product = controller.productsList[i];
                    return Card(
                      child: Column(
                        children: [
                          Text(product.id.toString()),
                          Text(product.title),
                          Text(product.description),
                          Text(product.category),
                          SizedBox(
                              height: 100,
                              width: 100,
                            child: Image.network(
                              product.imageUrl,
                            ),
                          ),
                          Text('\u{20B9} ${product.price.toString()}'),
                          Text(product.rating.rate.toString()),
                          Text(product.rating.count.toString()),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
