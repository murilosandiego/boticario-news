import 'package:boticario_news/ui/pages/feed/components/modal_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post_viewmodel.dart';

class PostWidget extends StatelessWidget {
  final NewsViewModel news;

  const PostWidget({@required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(
            news: news,
          ),
          SizedBox(height: 10),
          Text('${news.message}')
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final NewsViewModel news;

  const _Header({
    @required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://media-exp1.licdn.com/dms/image/C560BAQG4uMrwe88_iw/company-logo_200_200/0/1541427487948?e=2159024400&v=beta&t=LBMdRY6FnajvFN1nw46vFHscfkqRmMzOtpqW-8zqVi4'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${news.user}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${news.date}',
                  style: TextStyle(color: Theme.of(context).dividerColor),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 25,
          width: 25,
          child: FlatButton(
            textColor: Colors.black54,
            padding: EdgeInsets.zero,
            onPressed: () => getBottomSheet(context: context, news: news),
            child: Icon(Icons.more_vert),
          ),
        )
      ],
    );
  }
}

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
                'Editar ${news.id}',
                textAlign: TextAlign.center,
              ),
              onTap: () => showModalNewPost(context, news: news)),
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
