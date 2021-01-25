import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/form_signup.dart';
import 'components/icon_header.dart';

class SignUpPage extends StatelessWidget {
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
          'Criar conta',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: IconHeader(),
              ),
              FormSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
