import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
      ),
    );
  }
}
