//^ Displays list of maps/objects
import 'package:flutter/material.dart';
import 'package:flutter_apis/get_api_categories_controller/get_api_categories_controller.dart';
import 'package:flutter_apis/model/get_api_call_model.dart';
import 'package:get/get.dart';

class CategoryDetailScreen extends StatelessWidget {
  CategoryDetailScreen({super.key});

  final CategoryDetailController categoryDetailController =
      Get.put(CategoryDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category list of objects'),
      ),
      body: GetBuilder<CategoryDetailController>(
        init: categoryDetailController,
        builder: (controller) {
          return controller.categoryListMap.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.categoryListMap.length,
                  itemBuilder: (context, index) {
                    CategoryModelListMap category =
                        controller.categoryListMap[index];
                    return ListTile(
                      title: Text(category.name),
                      subtitle: Text(category.slug),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('URL: ${category.url}'),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
