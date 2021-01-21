import 'package:get/get.dart';
import 'package:mesa_news/ui/pages/welcome/welcome_page.dart';

import '../../ui/pages/login/login_page.dart';
import '../bindinds/login_bindind.dart';

abstract class AppPages {
  static const splash = '/';
  static const login = '/login';

  static final pages = [
    GetPage(
      name: splash,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
