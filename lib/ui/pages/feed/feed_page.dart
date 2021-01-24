import 'package:boticario_news/ui/pages/feed/components/modal_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/reload_screen.dart';
import 'components/post_widget.dart';
import 'feed_presenter.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<FeedPresenter>();

    return Scaffold(
      backgroundColor: Color(0xFFF0F2F5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feed',
          style: TextStyle(fontSize: 17),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalNewPost(context),
        child: Icon(Icons.post_add),
      ),
      body: Obx(
        () {
          if (presenter.errorMessage.isNotEmpty) {
            return ReloadScreen(
              error: presenter.errorMessage,
              reload: presenter.load,
            );
          }
          return presenter.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: presenter.news.length,
                  itemBuilder: (_, index) {
                    final news = presenter.news[index];
                    return PostWidget(news: news);
                  },
                );
        },
      ),
    );
  }
}
