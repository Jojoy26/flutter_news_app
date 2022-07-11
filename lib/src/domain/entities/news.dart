class News {
  String? author;
  String title;
  String description;
  String urlImage;
  String publishedAt;
  String content;
  News({
    this.author,
    required this.title,
    required this.description,
    required this.urlImage,
    required this.publishedAt,
    required this.content,
  });
}
