import 'package:boticario_news/ui/pages/feed/components/modal_post.dart';
import 'package:boticario_news/ui/pages/feed/post_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future getBottomSheet({
  @required BuildContext context,
  @required NewsViewModel news,
}) {
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
            onTap: () {},
          ),
        ],
      ),
    ),
  );
}
