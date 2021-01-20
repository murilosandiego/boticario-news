import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main/pages/app_pages.dart';
import 'ui/components/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MESA News',
      theme: makeAppTheme(),
      getPages: AppPages.pages,
      initialRoute: AppPages.splash,
    );
  }
}
