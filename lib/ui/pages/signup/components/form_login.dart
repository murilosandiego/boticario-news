import 'package:boticario_news/ui/pages/signup/signup_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_button.dart';
import '../../../components/app_text_form_field.dart';
import '../../../helpers/ui_error.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<SignUpPresenter>();

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 42),
      child: Column(
        children: [
          Obx(
            () => AppTextFormField(
              label: 'Nome',
              onChanged: presenter.handleEmail,
              errorText: presenter.emailError != null
                  ? presenter.emailError.description
                  : null,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          Obx(
            () => AppTextFormField(
              label: 'E-mail',
              onChanged: presenter.handleEmail,
              errorText: presenter.emailError != null
                  ? presenter.emailError.description
                  : null,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(height: 26),
          Obx(
            () => AppTextFormField(
              label: 'Senha',
              onChanged: presenter.handlePassword,
              errorText: presenter.passwordError != null
                  ? presenter.passwordError.description
                  : null,
              obscureText: true,
            ),
          ),
          SizedBox(height: 32),
          Obx(
            () => AppButton(
              isLoading: presenter.isLoading,
              text: 'Login',
              textColor: Colors.white,
              onPressed: presenter.isFormValid ? () => presenter.add() : null,
            ),
          ),
          SizedBox(height: 16),
          AppButton(
            outLine: true,
            text: 'Criar conta',
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
