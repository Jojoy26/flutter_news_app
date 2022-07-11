import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/src/presenter/news/news_controller.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/custom_app_bar.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/news_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewsController controller;
  late ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
    controller = Modular.get<NewsController>();
    controller.getNewsByCategory();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (controller.newsState.value == NewsState.sucessfully) {
          controller.loadMoreNews();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.getNewsBySearch();
            return;
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              CustomAppBar(),
              NewsList(),
            ],
          ),
        ),
      ),
    );
  }
}
