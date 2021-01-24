import 'package:boticario_news/ui/components/app_text_form_field.dart';
import 'package:boticario_news/ui/pages/feed/feed_presenter.dart';
import 'package:boticario_news/ui/pages/feed/post_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/ui_error.dart';

Future<void> showModalNewPost(BuildContext context, {NewsViewModel news}) {
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
          initialValue: news?.message ?? '',
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
