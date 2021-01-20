import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../application/http/http_client.dart';
import '../../application/usecases/remote_authentication.dart';
import '../../domain/usecases/authentication.dart';
import '../../infra/http/http_adapter.dart';
import '../../ui/pages/login/login_presenter.dart';
import '../factories/api_url_factory.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpClient>(() => HttpAdapter(Client()));
    Get.lazyPut<Authetication>(() => RemoteAuthentication(
        httpClient: Get.find(), url: makeApiUrl('v1/client/auth/signin')));
    Get.lazyPut(() => LoginPresenter(authetication: Get.find()));
  }
}
