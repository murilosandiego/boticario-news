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

  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Remover publicação?'),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Cancelar'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            presenter.remove(news.id);
          },
          child: Text(
            'Remover'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
