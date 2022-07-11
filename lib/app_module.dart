import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/src/domain/repositories/news_repository.dart';
import 'package:flutter_news_app/src/domain/usecase/get_news.dart';
import 'package:flutter_news_app/src/external/datasource/news_datasource.dart';
import 'package:flutter_news_app/src/infra/datasource/news_datasource.dart';
import 'package:flutter_news_app/src/infra/repository/news_repository.dart';
import 'package:flutter_news_app/src/presenter/news/news_controller.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Utils
        Bind.factory((i) => Dio()),
        // Usecase
        Bind.factory<IGetNews>((i) => GetNews(repository: i())),
        // Repository
        Bind.factory<INewsRepository>(
            (i) => NewsRepository(newsDatasource: i())),
        // Datasource
        Bind.factory<INewsDatasource>((i) => NewsDatasource(dio: i())),
        // Controllers
        Bind.singleton<NewsController>(
            (i) => NewsController(getNewsUsecase: i())),
      ];
}
