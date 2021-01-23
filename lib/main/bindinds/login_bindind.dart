import 'package:get/get.dart';

import '../../application/usecases/local_save_current_account.dart';
import '../../application/usecases/remote_authentication.dart';
import '../../domain/usecases/authentication.dart';
import '../../domain/usecases/save_current_account.dart';
import '../../ui/pages/login/login_presenter.dart';
import '../factories/api_url_factory.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Authetication>(() => RemoteAuthentication(
        httpClient: Get.find(), url: makeApiUrl('auth/local')));
    Get.lazyPut<SaveCurrentAccount>(
        () => LocalSaveCurrentAccount(localStorage: Get.find()));
    Get.lazyPut(() => LoginPresenter(
        authetication: Get.find(), saveCurrentAccount: Get.find()));
  }
}
