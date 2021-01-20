import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String label;

  const AppTextFormField({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            label,
            style: TextStyle(
              color: Color(
                0XFF000634,
              ),
              fontWeight: FontWeight.w500,
              fontSize: 12,
              letterSpacing: 0.41,
            ),
          ),
        ),
        TextFormField(),
      ],
    );
  }
}
