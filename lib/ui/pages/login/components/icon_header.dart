import 'package:flutter/material.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Image.asset('lib/ui/assets/icons/icon_login.png'),
      ),
    );
  }
}
