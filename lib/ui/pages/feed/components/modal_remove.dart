import '../feed_presenter.dart';
import '../post_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showModalRemove({
  @required NewsViewModel news,
  @required BuildContext context,
}) {
  final presenter = Get.find<FeedPresenter>();

  return Get.defaultDialog(
    title: 'Remover publicação?',
    content: Text('Essa ação não poderá ser desfeita'),
    textConfirm: 'Remover',
    confirmTextColor: Theme.of(context).backgroundColor,
    onConfirm: presenter.isFormValid == null
        ? null
        : () {
            Get.back();
            presenter.remove(news.id);
          },
    textCancel: 'Cancelar',
  );
}
