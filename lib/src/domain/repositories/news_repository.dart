import 'package:dartz/dartz.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';

abstract class INewsRepository {
  Future<Either<INewsException, List<News>>> getNews(GetNewsParams params);
}
