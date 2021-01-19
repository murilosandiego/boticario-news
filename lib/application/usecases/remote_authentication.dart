import 'package:meta/meta.dart' show required;

import '../http/http_client.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(
      url: url,
      method: 'post',
    );
  }
}
