import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:http/http.dart';
import 'package:mesa_news/application/http/http_client.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart' show required;

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter(this.client);

  Future<Map> request({
    @required String url,
    @required String method,
    Map body,
  }) async {
    final headers = {'Content-Type': 'application/json'};

    final jsonBody = body == null ? null : jsonEncode(body);

    final response = await client.post(
      url,
      headers: headers,
      body: jsonBody,
    );

    return jsonDecode(response.body);
  }
}

class ClientMock extends Mock implements Client {}

main() {
  HttpAdapter sut;
  ClientMock client;
  String url;

  setUp(() {
    client = ClientMock();
    sut = HttpAdapter(client);
    url = faker.internet.httpUrl();
  });

  group('post', () {
    setUp(() {
      when(
        client.post(
          any,
          body: anyNamed('body'),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => Response('{"any_key":"any_value"}', 200),
      );
    });

    test('Should call post with correct values', () async {
      await sut.request(
        url: url,
        method: 'post',
        body: {'any_key': 'any_value'},
      );

      verify(client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: '{"any_key":"any_value"}',
      ));
    });

    test('Should call post without body', () async {
      await sut.request(url: url, method: 'post');

      verify(client.post(
        any,
        headers: anyNamed('headers'),
      ));
    });

    test('Should return data if post returns 200', () async {
      final response = await sut.request(url: url, method: 'post');

      expect(response, {'any_key': 'any_value'});
    });
  });
}
