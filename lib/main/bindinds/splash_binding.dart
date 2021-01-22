import 'package:get/get.dart';
import 'package:mesa_news/application/usecases/local_load_current_account.dart';
import 'package:mesa_news/domain/usecases/load_current_account.dart';
import 'package:mesa_news/ui/pages/splash/splash_presenter.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadCurrentAccount>(
        () => LocalLoadCurrentAccount(localStorage: Get.find()));
    Get.put(SplashPresenter(loadCurrentAccount: Get.find()));
  }
}
