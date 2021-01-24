import 'package:boticario_news/application/usecases/remote_load_posts.dart';
import 'package:boticario_news/application/usecases/remote_save_post.dart';
import 'package:boticario_news/domain/usecases/load_posts.dart';
import 'package:boticario_news/domain/usecases/save_post.dart';
import 'package:boticario_news/main/factories/api_url_factory.dart';
import 'package:get/get.dart';

import '../../application/usecases/remote_load_news.dart';
import '../../domain/usecases/load_news.dart';
import '../../ui/pages/feed/feed_presenter.dart';

class FeedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadNews>(() => RemoteLoadNews(
          httpClient: Get.find(),
          url: makeApiNews(),
        ));

    Get.lazyPut<LoadPosts>(
      () => RemoteLoadPosts(
        httpClient: Get.find(),
        url: makeApiUrl('news'),
      ),
    );
    Get.lazyPut<SavePost>(
      () => RemoteSavePost(
        httpClient: Get.find(),
        url: makeApiUrl('news'),
      ),
    );
    Get.lazyPut(() => FeedPresenter(
          loadNews: Get.find(),
          loadPosts: Get.find(),
          savePost: Get.find(),
        ));
  }
}
