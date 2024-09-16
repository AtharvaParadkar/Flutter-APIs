class CategoryModel {
  final String names;

  CategoryModel({required this.names});

  //^ The factory constructor is used when you want to create an instance of a class in a controlled manner.
  factory CategoryModel.fromJson(String json) {
    return CategoryModel(names: json);
  }
}

class CategoryModelListMap {
  final String slug, name, url;

  CategoryModelListMap(
      {required this.slug, required this.name, required this.url});

  factory CategoryModelListMap.fromJson(Map<String, dynamic> json) {
    return CategoryModelListMap(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
