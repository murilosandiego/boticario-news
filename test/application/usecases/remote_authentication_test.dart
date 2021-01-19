import 'package:faker/faker.dart';
import 'package:mesa_news/application/http/http_client.dart';
import 'package:mesa_news/application/usecases/remote_authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientMock httpClient;
  String url;

  setUp(() {
    httpClient = HttpClientMock();
    url = faker.internet.httpUrl();

    sut = RemoteAuthentication(
      httpClient: httpClient,
      url: url,
    );
  });

  test('should call HttpClient with correct values', () async {
    await sut.auth();

    verify(httpClient.request(url: url, method: 'post'));
  });
}
