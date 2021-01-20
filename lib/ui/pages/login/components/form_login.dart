import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../components/app_text_form_field.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 42),
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
    );
  }
}
