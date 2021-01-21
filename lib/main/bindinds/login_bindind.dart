import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:mesa_news/application/storage/local_storage.dart';
import 'package:mesa_news/application/usecases/local_save_current_account.dart';
import 'package:mesa_news/domain/usecases/save_current_account.dart';
import 'package:mesa_news/infra/storage/local_storage_adater.dart';

import '../../application/http/http_client.dart';
import '../../application/usecases/remote_authentication.dart';
import '../../domain/usecases/authentication.dart';
import '../../infra/http/http_adapter.dart';
import '../../ui/pages/login/login_presenter.dart';
import '../factories/api_url_factory.dart';
import 'package:localstorage/localstorage.dart' as LocalStorageLib;

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpClient>(() => HttpAdapter(Client()));
    Get.lazyPut<LocalStorage>(() => LocalStorageAdapter(
        localStorage: LocalStorageLib.LocalStorage('app_local')));
    Get.lazyPut<Authetication>(() => RemoteAuthentication(
        httpClient: Get.find(), url: makeApiUrl('v1/client/auth/signin')));
    Get.lazyPut<SaveCurrentAccount>(
        () => LocalSaveCurrentAccount(localStorage: Get.find()));
    Get.lazyPut(() => LoginPresenter(
        authetication: Get.find(), saveCurrentAccount: Get.find()));
  }
}
