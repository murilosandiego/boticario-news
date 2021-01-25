import 'dart:ui';

import 'package:boticario_news/ui/components/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/form_login.dart';

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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoWidget(
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 50),
              FormLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
