import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final ShapeBorder shape;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Function onPressed;

  const AppButton(
      {Key key,
      this.shape,
      @required this.child,
      this.color,
      this.padding,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      width: double.infinity,
      child: RaisedButton(
        color: color ?? Theme.of(context).primaryColor,
        shape: shape,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
