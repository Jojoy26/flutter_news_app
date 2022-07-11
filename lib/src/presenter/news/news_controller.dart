import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/presenter/mixins/snack_bar.dart';
import 'package:flutter_news_app/src/presenter/models/category_model.dart';
import 'package:flutter_news_app/src/presenter/utils/categories_list.dart';
import 'package:get/get.dart';

import 'package:flutter_news_app/src/domain/usecase/get_news.dart';

class NewsController extends GetxController with SnackBar {
  final IGetNews getNewsUsecase;
  NewsController({
    required this.getNewsUsecase,
  }) {
    currentPage = 1;
    params = GetNewsParams(page: currentPage);
  }
  late GetNewsParams params;
  late int currentPage;

  CategoryModel get category => categoryList[selectedCategoryNumber.value];
  bool get isLoading => newsState.value == NewsState.loading;

  RxList<News> newsList = <News>[].obs;
  Rx<int> selectedCategoryNumber = 0.obs;
  Rx<String> search = ''.obs;
  Rx<NewsState> newsState = NewsState.loading.obs;
  Rx<bool> isLoadingMoreNews = false.obs;

  Future getNewsBySearch() async {
    currentPage = 1;
    params = GetNewsParams(
      page: currentPage,
      category: category.category,
      country: 'us',
      search: search.value,
    );
    newsState.value = NewsState.loading;
    final result = await getNewsUsecase.call(params);
    result.fold(
      (l) {
        callFailedSnackBar('Failed to search');
      },
      (r) {
        addItensToNewsList(r);
        newsState.value = NewsState.sucessfully;
      },
    );
  }

  Future getNewsByCategory() async {
    currentPage = 1;
    params = GetNewsParams(
      page: currentPage,
      category: category.category,
      country: 'us',
      search: '',
    );
    newsState.value = NewsState.loading;
    final result = await getNewsUsecase.call(params);
    result.fold(
      (l) {
        callFailedSnackBar('Failed to load news');
      },
      (r) {
        newsState.value = NewsState.sucessfully;
        addItensToNewsList(r);
      },
    );
  }

  Future loadMoreNews() async {
    isLoadingMoreNews.value = true;
    currentPage += 1;
    params.page = currentPage;
    final result = await getNewsUsecase.call(params);
    result.fold((l) {
      callFailedSnackBar('Failed to load more news');
      isLoadingMoreNews.value = false;
      currentPage -= 1;
    }, (r) {
      newsList.value = [...newsList, ...r];
      isLoadingMoreNews.value = false;
    });
  }

  void onCategoryPress(int index) {
    currentPage = 1;
    selectedCategoryNumber.value = index;
    getNewsByCategory();
  }

  void addItensToNewsList(List<News> newsListResult) {
    newsList.value = newsListResult;
  }
}

enum NewsState { loading, sucessfully }
