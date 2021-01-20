import 'package:flutter/material.dart';
import 'package:mesa_news/ui/pages/splash/components/buttons.dart';
import 'package:mesa_news/ui/pages/splash/components/logo.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Logo(),
          Buttons(),
        ],
      ),
    );
  }
}
