import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart' show required;

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {
    await httpClient.request(url: url);
  }
}

abstract class HttpClient {
  Future<void> request({
    @required String url,
  });
}

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  test('should call HttpClient with correct URL', () async {
    final httpClient = HttpClientMock();
    final url = faker.internet.httpUrl();

    final sut = RemoteAuthentication(
      httpClient: httpClient,
      url: url,
    );

    await sut.auth();

    verify(httpClient.request(url: url));
  });
}
