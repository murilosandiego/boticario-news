import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final ShapeBorder shape;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Function onPressed;
  final bool outLine;
  final Color borderColor;

  const AppButton({
    Key key,
    this.shape,
    @required this.text,
    this.color,
    this.padding,
    this.onPressed,
    this.textColor,
    this.outLine = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: 48,
      width: double.infinity,
      child: FlatButton(
        disabledColor: color == null
            ? Theme.of(context).primaryColor.withOpacity(0.5)
            : color.withOpacity(0.5),
        color: color ?? Theme.of(context).primaryColor,
        shape: outLine
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                  color: borderColor ?? Theme.of(context).primaryColor,
                ),
              )
            : null,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Theme.of(context).primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
