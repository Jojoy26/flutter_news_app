import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';

abstract class INewsDatasource {
  Future<List<News>> getNews(GetNewsParams params);
}
