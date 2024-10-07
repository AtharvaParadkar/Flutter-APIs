class PhotosModel {
  final int id;
  final String title, url, thumbnailUrl;

  PhotosModel(
      {required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory PhotosModel.fromJson(Map<dynamic, dynamic> json) {
    return PhotosModel(
      id: json['_id'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
