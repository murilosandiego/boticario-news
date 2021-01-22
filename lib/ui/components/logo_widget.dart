import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('lib/ui/assets/icons/logo.png'),
        SizedBox(height: 19),
        Text(
          'NEWS',
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 19,
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
