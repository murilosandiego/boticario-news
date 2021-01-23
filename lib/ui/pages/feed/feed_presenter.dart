import 'dart:convert' show utf8;

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/usecases/load_news.dart';
import '../../helpers/ui_error.dart';
import 'post_viewmodel.dart';

class FeedPresenter extends GetxController {
  final LoadNews loadNews;

  final _news = Rx<List<NewsViewModel>>();
  final _isLoading = true.obs;
  final _errorMessage = ''.obs;

  List<NewsViewModel> get news => _news.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  FeedPresenter({@required this.loadNews});

  load() async {
    _errorMessage.value = '';
    try {
      final newsEntity = await loadNews.load();
      _news.value = newsEntity
          .map(
            (news) => NewsViewModel(
              message: utf8.decode(news.message.content.runes.toList()),
              date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR')
                  .format(news.message.createdAt),
              user: utf8.decode(news.user.name.runes.toList()),
            ),
          )
          .toList();
    } catch (error) {
      _errorMessage.update((_) {});

      _errorMessage.value = UIError.unexpected.description;
    } finally {
      _isLoading.value = false;
    }
  }
}
