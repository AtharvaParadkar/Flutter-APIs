class RecipeModel{
  final String foods;

  RecipeModel({required this.foods});

  factory RecipeModel.fromJson(String json){
    return RecipeModel(foods: json);
  }
}

class PostsModel{
  final String post;

  PostsModel({required this.post});

  factory PostsModel.fromJson(String json){
    return PostsModel(post: json);
  }
}