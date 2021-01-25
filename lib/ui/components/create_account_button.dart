import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final bool backgroundWhite;
  final Function onPressed;
  final String nameButton;
  final String nameLeading;

  const CreateAccountButton(
      {Key key,
      this.backgroundWhite = true,
      @required this.onPressed,
      this.nameButton = 'Cadastrar',
      this.nameLeading = 'Não tenho conta. '})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nameLeading,
            style: TextStyle(
                color: backgroundWhite
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor,
                fontWeight: FontWeight.w500,
                // fontSize: 14,
                letterSpacing: -0.41),
          ),
          Text(
            nameButton,
            style: TextStyle(
              color: Color(0XFF0075FF),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
