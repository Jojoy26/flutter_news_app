import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/presenter/news/news_page.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: NewsPage(),
    );
  }
}
