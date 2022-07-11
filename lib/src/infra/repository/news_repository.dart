import 'package:dartz/dartz.dart';

import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/repositories/news_repository.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_news_app/src/infra/datasource/news_datasource.dart';

class NewsRepository implements INewsRepository {
  final INewsDatasource newsDatasource;
  NewsRepository({
    required this.newsDatasource,
  });

  @override
  Future<Either<INewsException, List<News>>> getNews(
      GetNewsParams params) async {
    try {
      final response = await newsDatasource.getNews(params);
      return Right(response);
    } catch (e) {
      return Left(DatasourceException(message: 'Datasource error'));
    }
  }
}
