import 'dart:convert' show utf8;

import 'package:boticario_news/domain/entities/post_entity.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/usecases/load_news.dart';
import '../../../domain/usecases/load_posts.dart';
import '../../helpers/ui_error.dart';
import 'post_viewmodel.dart';

class FeedPresenter extends GetxController {
  final LoadNews loadNews;
  final LoadPosts loadPosts;

  final news = RxList<NewsViewModel>();
  final _isLoading = true.obs;
  final _errorMessage = ''.obs;

  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;

  FeedPresenter({
    @required this.loadNews,
    @required this.loadPosts,
  });

  load() async {
    _errorMessage.value = '';
    try {
      final newsBoticario = await loadNews.load();
      final postsUsers = await loadPosts.load();

      newsBoticario.addAll(postsUsers);

      final sortedResult = newsBoticario
        ..sort(
          (a, b) => b.message.createdAt.compareTo(a.message.createdAt),
        );

      final postsViewModel = _toViewModel(sortedResult);

      news.assignAll(postsViewModel);
    } catch (error) {
      _errorMessage.update((_) {});

      _errorMessage.value = UIError.unexpected.description;
    } finally {
      _isLoading.value = false;
    }
  }

  List<NewsViewModel> _toViewModel(List<PostEntity> posts) {
    return posts
        .map(
          (news) => NewsViewModel(
            message: utf8.decode(news.message.content.runes.toList()),
            date: DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_BR')
                .format(news.message.createdAt),
            user: utf8.decode(news.user.name.runes.toList()),
          ),
        )
        .toList();
  }
}
