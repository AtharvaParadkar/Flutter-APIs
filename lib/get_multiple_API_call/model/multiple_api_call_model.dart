class RecipeModel {
  final String foods;

  RecipeModel({required this.foods});

  factory RecipeModel.fromJson(String json) {
    return RecipeModel(foods: json);
  }
}

class PostsModel {
  final String postTag;

  PostsModel({required this.postTag});

  factory PostsModel.fromJson(String json) {
    return PostsModel(postTag: json);
  }
}

class PostsTagModel {
  final String postTag, name, url;

  PostsTagModel({required this.postTag, required this.name, required this.url});

  factory PostsTagModel.fromJson(Map<String, dynamic> json) {
    return PostsTagModel(
      postTag: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
