import 'package:get/get.dart';

import '../../application/usecases/local_load_current_account.dart';
import '../../domain/usecases/load_current_account.dart';
import '../../ui/pages/splash/splash_presenter.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadCurrentAccount>(
        () => LocalLoadCurrentAccount(localStorage: Get.find()));
    Get.put(SplashPresenter(loadCurrentAccount: Get.find()));
  }
}
