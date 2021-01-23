import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Criar publicação',
          style: TextStyle(
            fontSize: 17,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Publicar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'O que deseja compartilhar?',
              contentPadding: EdgeInsets.all(16),
              fillColor: Theme.of(context).backgroundColor,
              filled: true,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            maxLines: 8,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text('280'),
          ),
        ],
      ),
    );
  }
}
