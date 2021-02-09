import 'package:boticario_news/ui/pages/feed/cubit/feed_cubit.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

import '../../application/usecases/remote_load_news.dart';
import '../../application/usecases/remote_load_posts.dart';
import '../../application/usecases/remote_remove_post.dart';
import '../../application/usecases/remote_save_post.dart';
import '../../domain/usecases/load_news.dart';
import '../../domain/usecases/load_posts.dart';
import '../../domain/usecases/remove_post.dart';
import '../../domain/usecases/save_post.dart';
import '../../ui/pages/feed/feed_presenter.dart';
import '../factories/api_url_factory.dart';

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
          userSession: Get.find()),
    );
    Get.lazyPut<RemovePost>(
      () => RemoteRemovePost(
        httpClient: Get.find(),
        url: makeApiUrl('news'),
      ),
    );
    Get.lazyPut(
      () => FeedPresenter(
        loadNews: Get.find(),
        loadPosts: Get.find(),
        savePost: Get.find(),
        removePost: Get.find(),
        userSession: Get.find(),
        localStorage: Get.find<LocalStorage>(),
      ),
    );
    Get.lazyPut(
      () => FeedCubit(
        loadNews: Get.find(),
        loadPosts: Get.find(),
        savePost: Get.find(),
        removePost: Get.find(),
        userSession: Get.find(),
        localStorage: Get.find<LocalStorage>(),
      ),
    );
  }
}
