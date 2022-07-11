import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/src/presenter/news/news_controller.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/news_card.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/shimmer_news_card.dart';
import 'package:get/get.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<NewsController>();

    return SliverPadding(
      padding: EdgeInsets.only(left: 18, right: 18, top: 30, bottom: 20),
      sliver: Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index == controller.newsList.length &&
                  !controller.isLoading) {
                return Obx(
                  () => Container(
                    child: controller.isLoadingMoreNews.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(),
                  ),
                );
              }
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                child: controller.isLoading
                    ? ShimmerNewsCard()
                    : NewsCard(
                        news: controller.newsList[index],
                      ),
              );
            },
            childCount: controller.newsState.value == NewsState.loading
                ? 4
                : controller.newsList.length + 1,
          ),
        ),
      ),
    );
  }
}
