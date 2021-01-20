import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mesa_news/ui/components/app_button.dart';
import 'package:mesa_news/ui/components/app_text_form_field.dart';
import 'package:mesa_news/ui/components/create_account_button.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Image.asset('lib/ui/assets/icons/icon_login.png'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 42),
                  child: Column(
                    children: [
                      AppTextFormField(label: 'E-mail'),
                      SizedBox(height: 26),
                      AppTextFormField(label: 'Senha'),
                      SizedBox(height: 32),
                      AppButton(
                        text: 'Login',
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Column(
                    children: [
                      AppButton(
                        outLine: true,
                        text: 'Entrar com facebook',
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      SizedBox(height: 24),
                      CreateAccountButton(
                        backgroundWhite: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
