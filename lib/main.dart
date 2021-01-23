import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main/bindinds/initial_bindind.dart';
import 'main/pages/app_pages.dart';
import 'ui/components/app_theme.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: 'Boticário News',
      theme: makeAppTheme(),
      getPages: AppPages.pages,
      initialRoute: AppPages.feed,
    );
  }
}
