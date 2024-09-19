class RecipeModel{
  final String foods;

  RecipeModel({required this.foods});

  factory RecipeModel.fromJson(String json){
    return RecipeModel(foods: json);
  }
}

class PostsModel{
  final String postTag;

  PostsModel({required this.postTag});

  factory PostsModel.fromJson(String json){
    return PostsModel(postTag: json);
  }
}