import 'package:get/get.dart';

import '../../application/usecases/remote_load_news.dart';
import '../../domain/usecases/load_news.dart';
import '../../ui/pages/feed/feed_presenter.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    const urlNews = 'https://gb-mobile-app-teste.s3.amazonaws.com/data.json';
    Get.lazyPut<LoadNews>(
        () => RemoteLoadNews(httpClient: Get.find(), url: urlNews));
    Get.lazyPut(() => FeedPresenter(loadNews: Get.find()));
  }
}
