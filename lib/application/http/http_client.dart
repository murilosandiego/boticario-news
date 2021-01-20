import 'package:meta/meta.dart' show required;

abstract class HttpClient {
  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  });
}
