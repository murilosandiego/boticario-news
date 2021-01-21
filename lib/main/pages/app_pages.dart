import 'package:get/get.dart';

import '../../ui/pages/login/login_page.dart';
import '../../ui/pages/splash/splash_page.dart';
import '../bindinds/login_bindind.dart';

abstract class AppPages {
  static const splash = '/';
  static const login = '/login';

  static final pages = [
    GetPage(
      name: splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
