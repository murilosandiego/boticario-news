import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../feed_presenter.dart';
import '../post_viewmodel.dart';
import 'modal_post.dart';

Future getBottomSheet({
  @required BuildContext context,
  @required NewsViewModel news,
}) {
  final presenter = Get.find<FeedPresenter>();

  return Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Wrap(
        children: <Widget>[
          ListTile(
              title: Text(
                'Editar',
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Get.back();
                return showModalPost(context, news: news);
              }),
          ListTile(
            title: Text(
              'Remover',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Get.back();
              presenter.remove(news.id);
            },
          ),
        ],
      ),
    ),
  );
}
