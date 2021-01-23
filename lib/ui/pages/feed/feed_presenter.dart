import 'dart:convert' show utf8;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/usecases/load_news.dart';
import 'news_viewmodel.dart';

class FeedPresenter extends GetxController {
  final LoadNews loadNews;

  final _news = Rx<List<NewsViewModel>>();
  final _isLoading = true.obs;

  List<NewsViewModel> get news => _news.value;
  bool get isLoading => _isLoading.value;

  FeedPresenter({@required this.loadNews});

  load() async {
    try {
      final newsEntity = await loadNews.load();
      _news.value = newsEntity
          .map(
            (news) => NewsViewModel(
              message: utf8.decode(news.message.content.runes.toList()),
              date:
                  DateFormat('dd/MM/yyyy hh:mm').format(news.message.createdAt),
              user: utf8.decode(news.user.name.runes.toList()),
            ),
          )
          .toList();
    } catch (error) {} finally {
      _isLoading.value = false;
    }
  }
}
