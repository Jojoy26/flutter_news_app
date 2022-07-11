import 'package:flutter_news_app/src/domain/entities/news.dart';

class NewsMapper {
  static News fromJson(Map<String, dynamic> data) {
    return News(
      author: data['author'],
      title: data['title'],
      description: data['description'],
      urlImage: data['urlToImage'],
      publishedAt: data['publishedAt'],
      content: data['content'],
    );
  }
}
