import 'package:flutter/material.dart';

import 'components/buttons.dart';
import 'components/logo.dart';

class WelcomePage extends StatelessWidget {
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
