import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/domain/errors/news_errors.dart';
import 'package:flutter_news_app/src/domain/repositories/news_repository.dart';

abstract class IGetNews {
  Future<Either<INewsException, List<News>>> call(GetNewsParams params);
}

class GetNews implements IGetNews {
  final INewsRepository repository;
  GetNews({
    required this.repository,
  });

  @override
  Future<Either<INewsException, List<News>>> call(GetNewsParams params) async {
    if (params.page < 0) {
      return Left(
        ArgumentsException(
          message: 'Page must be greather than 0 or equal to 0',
        ),
      );
    }

    return await repository.getNews(params);
  }
}

class GetNewsParams {
  String? category;
  String? country;
  String? search;
  int page;
  GetNewsParams({
    this.category,
    this.country,
    this.search,
    required this.page,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'country': country,
      'search': search,
      'page': page,
    };
  }

  factory GetNewsParams.fromMap(Map<String, dynamic> map) {
    return GetNewsParams(
      category: map['category'],
      country: map['country'],
      search: map['search'],
      page: map['page']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetNewsParams.fromJson(String source) =>
      GetNewsParams.fromMap(json.decode(source));
}
