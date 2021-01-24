import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/app_text_form_field.dart';
import '../../components/reload_screen.dart';
import 'components/post_widget.dart';
import 'feed_presenter.dart';
import '../.././helpers/ui_error.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<FeedPresenter>();
    // presenter.load();

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

Future<void> showModalNewPost(BuildContext context) {
  final presenter = Get.find<FeedPresenter>();

  return Get.defaultDialog(
    title: 'Nova publicação',
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => AppTextFormField(
          label: 'O que deseja compartilhar?',
          maxLines: 5,
          onChanged: presenter.handleNewPostMessage,
          errorText: presenter.errorMessageNewPost == null
              ? null
              : presenter.errorMessageNewPost.description,
        ),
      ),
    ),
    textConfirm: 'Publicar',
    confirmTextColor: Theme.of(context).backgroundColor,
    onConfirm: presenter.isFormValid == null
        ? null
        : () {
            Get.back();
            presenter.save();
          },
    textCancel: 'Cancelar',
  );
}
