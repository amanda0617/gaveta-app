import 'package:get/get.dart';

import '../../models/news_model.dart';
import '../../repositories/home/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  final Rx<bool> isLoading = false.obs;
  final List<NewsModel> newsList = [];

  HomeController({required this.homeRepository});

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  void _loadData() async {
    isLoading.value = true;
    final result = await homeRepository.fetchNews();

    if (result != null) {
      final list = result.map((e) => NewsModel.fromMap(e)).toList();
      newsList.addAll(list);
    }
    isLoading.value = false;
  }
}
