import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
        children: [
          _Header(),
          SizedBox(height: 10),
          Text(
            'Com a união  asdoijsocial de diversas partes do país."',
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://scontent.fmoc1-1.fna.fbcdn.net/v/t1.0-1/p200x200/99157896_334500170863276_9167020949239758848_o.jpg?_nc_cat=105&ccb=2&_nc_sid=7206a8&_nc_ohc=Xtm0Hm1jI24AX9djcx3&_nc_ht=scontent.fmoc1-1.fna&tp=6&oh=3fbc67e7c268a8a829c8b41a6e8afe06&oe=603067CD'),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Murilo Sandiego',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '19 de setembro de 2020',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
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
            onPressed: () {},
            child: Icon(Icons.more_vert),
          ),
        )
      ],
    );
  }
}
