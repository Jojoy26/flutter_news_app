import 'package:dartz/dartz.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/repositories/news_repository.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class NewsRepositoryMock extends Mock implements INewsRepository {}

void main() {
  final repository = NewsRepositoryMock();
  final usecase = GetNews(repository: repository);
  final newsParams = GetNewsParams(page: 0);
  test('Should return a news list', () async {
    when(() => repository.getNews(newsParams))
        .thenAnswer((invocation) async => Right([]));

    final response = await usecase(newsParams);

    expect(response.fold(id, id), isA<List<News>>());
  });

  test('Should return arguments exception if page is less than 0', () async {
    final newsParams = GetNewsParams(page: -2);
    when(() => repository.getNews(newsParams))
        .thenAnswer((invocation) async => Right([]));

    final response = await usecase(newsParams);

    expect(response.fold(id, id), isA<ArgumentsException>());
  });
}
