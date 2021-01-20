import 'package:flutter/material.dart';

import '../../../components/app_button.dart';
import '../../../components/create_account_button.dart';

class FacebookLoginButton extends StatelessWidget {
  const FacebookLoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
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
    );
  }
}
