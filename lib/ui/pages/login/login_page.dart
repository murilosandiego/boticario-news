import 'dart:ui';

import 'package:boticario_news/ui/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/facebook_login_button.dart';
import 'components/form_login.dart';
import 'components/icon_header.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Entrar com e-mail',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconHeader(),
                FormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
