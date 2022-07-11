import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_news_app/src/external/datasource/news_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = NewsDatasource(dio: dio);
  final newsParams = GetNewsParams(page: 0);
  test('Should return a news list', () async {
    when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer(
      (invocation) async => Future.value(
        Response(
          data: [],
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
        ),
      ),
    );

    final response = await datasource.getNews(newsParams);

    expect(response, isA<List<News>>());
  });

  test('Should throw a DatasourceException if statusCode is diferent to 200',
      () async {
    when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
        .thenAnswer(
      (invocation) async => Future.value(
        Response(
          data: null,
          requestOptions: RequestOptions(path: ''),
          statusCode: 401,
        ),
      ),
    );

    final response = datasource.getNews(newsParams);

    expect(response, throwsA(isA<DatasourceException>()));
  });

  test('Should throw a DatasourceException if dio throw a error', () async {
    when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
        .thenThrow(DioError(
            requestOptions: RequestOptions(path: ''),
            error: DioErrorType.connectTimeout));

    final response = datasource.getNews(newsParams);

    expect(response, throwsA(isA<DatasourceException>()));
  });
}
