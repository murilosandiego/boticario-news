import '../feed_presenter.dart';
import '../post_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../helpers/ui_error.dart';
import 'package:get/get.dart';

Future<void> showModalPost(BuildContext context, {NewsViewModel news}) {
  final presenter = Get.find<FeedPresenter>();
  presenter.clearMessagePost();
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text('Criar publicação'),
      content: Obx(
        () => TextFormField(
          decoration: InputDecoration(
            hintText: 'O que deseja compartilhar?',
            errorText: presenter.errorMessageNewPost == null
                ? null
                : presenter.errorMessageNewPost.description,
            errorBorder: InputBorder.none,
            border: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            fillColor: Theme.of(context).backgroundColor,
            filled: true,
            contentPadding: EdgeInsets.zero,
          ),
          maxLines: null,
          onChanged: presenter.handleNewPostMessage,
          initialValue: news?.message ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            'Cancelar'.toUpperCase(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Obx(
          () => TextButton(
            onPressed: presenter.isFormValid == false
                ? null
                : () {
                    Get.back();
                    presenter.save(
                      postId: news?.id,
                    );
                  },
            child: Text(
              'Publicar'.toUpperCase(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
