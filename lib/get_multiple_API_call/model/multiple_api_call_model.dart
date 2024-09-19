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

class MoviesModel {
  final String movieName, movieImage, imdbUrl;
  final int id;
  final double rating;

  MoviesModel(
      {required this.movieName,
      required this.movieImage,
      required this.imdbUrl,
      required this.id,
      required this.rating});

  factory MoviesModel.fromJson(Map<dynamic, dynamic> json) {
    return MoviesModel(
      movieName: json['movie'],
      movieImage: json['image'],
      imdbUrl: json['imdb_url'],
      id: json['id'],
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'],
    );
  }
}
