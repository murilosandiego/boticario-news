import 'package:boticario_news/domain/usecases/load_news.dart';
import 'package:meta/meta.dart' show required;

import '../../domain/entities/news_entity.dart';
import '../../domain/errors/domain_error.dart';
import '../http/http_client.dart';
import '../models/news_model.dart';

class RemoteLoadNews implements LoadNews {
  final HttpClient httpClient;
  final String url;

  RemoteLoadNews({@required this.httpClient, @required this.url});

  Future<List<NewsEntity>> load() async {
    try {
      final response = await httpClient.request(url: url, method: 'get');
      return (response['news'] as List)
          .map((json) => NewsModel.fromJson(json))
          .toList()
            ..sort(
                (a, b) => b.message.createdAt.compareTo(a.message.createdAt));
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
