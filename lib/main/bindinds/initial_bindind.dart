import 'package:boticario_news/ui/helpers/user_session.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart' as LocalStorageLib;

import '../../application/http/http_client.dart';
import '../../application/storage/local_storage.dart';
import '../../infra/http/http_adapter.dart';
import '../../infra/storage/local_storage_adater.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    final storage = LocalStorageLib.LocalStorage('app_local');
    Get.put(UserSession(), permanent: true);
    Get.put<HttpClient>(HttpAdapter(Client()), permanent: true);
    Get.put<LocalStorage>(LocalStorageAdapter(localStorage: storage),
        permanent: true);
  }
}
