import 'package:dio/dio.dart';

import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_news_app/src/external/datasource/mapper.dart';
import 'package:flutter_news_app/src/infra/datasource/news_datasource.dart';

class NewsDatasource implements INewsDatasource {
  final Dio dio;
  NewsDatasource({
    required this.dio,
  });

  @override
  Future<List<News>> getNews(GetNewsParams params) async {
    try {
      final response = await dio.get(
        'http://192.168.0.106:3333/api/news',
        queryParameters: params.toMap(),
      );

      if (response.statusCode != 200) {
        throw DatasourceException(message: 'Error in response');
      }

      List<News> list =
          (response.data as List).map((e) => NewsMapper.fromJson(e)).toList();
      return list;
    } on DioError catch (e) {
      throw DatasourceException(message: 'Dio error, ${e.type}');
    }
  }
}
