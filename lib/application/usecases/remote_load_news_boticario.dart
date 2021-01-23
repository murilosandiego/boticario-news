import 'package:boticario_news/domain/usecases/load_posts.dart';
import 'package:meta/meta.dart' show required;

import '../../domain/entities/news_entity.dart';
import '../../domain/errors/domain_error.dart';
import '../http/http_client.dart';
import '../models/news_model.dart';

class RemoteLoadNewsBoticario implements LoadPosts {
  final HttpClient httpClient;
  final String url;

  RemoteLoadNewsBoticario({@required this.httpClient, @required this.url});

  Future<List<NewsEntity>> load() async {
    try {
      final response = await httpClient.request(url: url, method: 'get');
      return (response['news'] as List)
          .map((json) => NewsModel.fromJson(json))
          .toList();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
