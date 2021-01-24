import 'package:boticario_news/domain/usecases/remove_post.dart';
import 'package:meta/meta.dart';

import '../../domain/errors/domain_error.dart';
import '../http/http_client.dart';

class RemoteRemovePost implements RemovePost {
  final HttpClient httpClient;
  final String url;

  RemoteRemovePost({this.httpClient, this.url});

  @override
  Future<bool> remove({@required int postId}) async {
    try {
      return await httpClient.request(
        url: '$url/$postId',
        method: 'delete',
      );
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
