import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_button.dart';
import '../../../components/app_text_form_field.dart';
import '../login_presenter.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<LoginPresenter>();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 42),
      child: Column(
        children: [
          Obx(
            () => AppTextFormField(
              label: 'E-mail',
              onChanged: presenter.validateEmail,
              errorText: presenter.emailError,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(height: 26),
          AppTextFormField(
            label: 'Senha',
            obscureText: true,
          ),
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
