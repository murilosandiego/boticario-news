import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/usecases/load_news.dart';
import 'news_viewmodel.dart';

class FeedPresenter {
  final LoadNews loadNews;

  final _news = Rx<List<NewsViewModel>>();

  List<NewsViewModel> get news => _news.value;

  FeedPresenter({@required this.loadNews});

  load() async {
    final newsEntity = await loadNews.load();
    final resultMap = newsEntity
        .map(
          (news) => NewsViewModel(
            message: news.message.content,
            date: DateFormat('dd/MM/yyyy').format(news.message.createdAt),
            user: news.user.name,
          ),
        )
        .toList();

    _news.value = resultMap;
  }
}
