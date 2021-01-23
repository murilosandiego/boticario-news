import 'package:boticario_news/ui/pages/feed/components/post_widget.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F2F5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Feed',
            style: TextStyle(fontSize: 17),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          children: [
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
            PostWidget(),
          ],
        ));
  }
}
