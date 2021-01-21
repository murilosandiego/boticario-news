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

    Get.lazyPut<HttpClient>(() => HttpAdapter(Client()));
    Get.lazyPut<LocalStorage>(() => LocalStorageAdapter(localStorage: storage));
  }
}
