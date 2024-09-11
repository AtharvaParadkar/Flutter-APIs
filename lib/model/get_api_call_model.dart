class CategoryModel{
  final String names;

  CategoryModel({required this.names});

  factory CategoryModel.fromJson(String json){
    return CategoryModel(names: json);
  }
}