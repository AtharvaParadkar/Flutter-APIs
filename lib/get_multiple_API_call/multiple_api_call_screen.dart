import 'package:flutter/material.dart';
import 'package:flutter_apis/get_multiple_API_call/multiple_api_call_controller/multiple_api_controller.dart';
import 'package:get/get.dart';

class MultipleApiCallScreen extends StatelessWidget {
  const MultipleApiCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple API Call'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        children: [
          RecipeCallScreen(),
          PostsCallScreen(),
        ],
      ),
    );
  }
}

class RecipeCallScreen extends StatelessWidget {
  RecipeCallScreen({super.key});

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (recipeController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (recipeController.recipies.isEmpty) {
        return const Text('No Foods Found');
      } else {
        return ListView.builder(
            itemCount: recipeController.recipies.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(recipeController.recipies[i].foods),
              );
            });
      }
    });
  }
}

class PostsCallScreen extends StatelessWidget {
  PostsCallScreen({super.key});

  final PostsController postsController = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (postsController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else if (postsController.posts.isEmpty) {
        return const Text('No Foods Found');
      } else {
        return ListView.builder(
            itemCount: postsController.posts.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(postsController.posts[i].postTag),
              );
            });
      }
    });
  }
}
