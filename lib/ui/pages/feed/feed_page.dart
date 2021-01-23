import 'feed_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main/pages/app_pages.dart';
import 'components/post_widget.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<FeedPresenter>();
    presenter.load();

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
        onPressed: () => Get.toNamed(AppPages.newPost),
        child: Icon(Icons.post_add),
      ),
      body: Obx(
        () {
          return presenter.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: presenter.news?.length,
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
