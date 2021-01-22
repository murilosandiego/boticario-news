import 'package:flutter/material.dart';
import 'package:mesa_news/ui/components/logo_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: LogoWidget(),
      ),
    );
  }
}
