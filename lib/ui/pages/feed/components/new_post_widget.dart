import 'package:boticario_news/ui/components/app_text_form_field.dart';
import 'package:flutter/material.dart';

class NewPostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 4,
          ),
          Expanded(
            child: AppTextFormField(
              label: 'O que deseja compartilhar?',
              maxLines: null,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
            hoverColor: Colors.red,
          )
        ],
      ),
    );
  }
}
