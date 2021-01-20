import 'package:flutter/material.dart';
import 'package:mesa_news/ui/components/app_theme.dart';
import 'package:mesa_news/ui/pages/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MESA News',
      theme: makeAppTheme(),
      home: SplashPage(),
    );
  }
}
