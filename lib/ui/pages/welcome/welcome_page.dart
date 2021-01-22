import 'package:flutter/material.dart';

import '../../components/logo_widget.dart';
import 'components/buttons.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(child: LogoWidget()),
          Buttons(),
        ],
      ),
    );
  }
}
