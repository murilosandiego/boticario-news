import 'dart:convert' as dartConvert;

import 'package:http/http.dart';
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

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    return dartConvert.jsonDecode(response.body);
  }
}
