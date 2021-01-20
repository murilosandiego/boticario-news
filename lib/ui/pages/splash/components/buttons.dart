import 'package:flutter/material.dart';
import 'package:mesa_news/ui/components/app_button.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          child: Text(
            'Entrar com facebook',
            style: TextStyle(
              color: Color(0XFF0075FF),
            ),
          ),
          color: Colors.white,
          onPressed: () {},
        ),
        SizedBox(height: 16),
        AppButton(
          child: Text(
            'Entrar com e-mail',
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Não tenho conta. ',
                style: TextStyle(
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Cadastrar',
                  style: TextStyle(color: Color(0XFF0075FF)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
