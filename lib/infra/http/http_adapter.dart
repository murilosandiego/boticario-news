import 'dart:convert' as dartConvert;

import 'package:http/http.dart';
import '../../application/http/http_error.dart';
import 'package:meta/meta.dart';

import '../../application/http/http_client.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  }) async {
    final headers = {'Content-Type': 'application/json'};

    final jsonBody = body == null ? null : dartConvert.jsonEncode(body);
    Response response;

    try {
      if (method == 'post') {
        response = await client.post(
          url,
          headers: headers,
          body: jsonBody,
        );
      }
    } catch (_) {
      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return dartConvert.jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      default:
        throw HttpError.serverError;
    }
  }
}
