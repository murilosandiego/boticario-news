import '../../domain/entities/post_entity.dart';
import '../../domain/errors/domain_error.dart';
import '../../domain/usecases/save_post.dart';
import '../http/http_client.dart';
import '../models/post_model.dart';

class RemoteSavePost implements SavePost {
  final HttpClient httpClient;
  final String url;

  RemoteSavePost({this.httpClient, this.url});

  @override
  Future<PostEntity> save({String message}) async {
    final body = {
      "message": {"content": message},
      "users_permissions_user": 1
    };
    try {
      final httpResponse =
          await httpClient.request(url: url, method: 'post', body: body);

      return PostModel.fromJsonApiPosts(httpResponse);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
