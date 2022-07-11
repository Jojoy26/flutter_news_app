import 'package:dartz/dartz.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_news_app/src/infra/datasource/news_datasource.dart';
import 'package:flutter_news_app/src/infra/repository/news_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NewsDatasourceMock extends Mock implements INewsDatasource {}

void main() {
  final datasource = NewsDatasourceMock();
  final repository = NewsRepository(newsDatasource: datasource);
  final newsParams = GetNewsParams(page: 0);
  test('Should return a news list', () async {
    when(() => datasource.getNews(newsParams))
        .thenAnswer((invocation) async => []);
    final response = await repository.getNews(newsParams);

    expect(response.fold(id, id), isA<List<News>>());
  });

  test('Should return a Datasource exception if datasource failed', () async {
    when(() => datasource.getNews(newsParams)).thenThrow(Exception());
    final response = await repository.getNews(newsParams);

    expect(response.fold(id, id), isA<DatasourceException>());
  });
}
