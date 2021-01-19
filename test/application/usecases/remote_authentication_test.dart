import 'package:faker/faker.dart';
import 'package:mesa_news/application/http/http_client.dart';
import 'package:mesa_news/application/usecases/remote_authentication.dart';
import 'package:mesa_news/domain/usecases/authentication.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  RemoteAuthentication sut;
  HttpClientMock httpClient;
  String url;
  AuthenticationParams params;

  setUp(() {
    httpClient = HttpClientMock();
    url = faker.internet.httpUrl();

    sut = RemoteAuthentication(
      httpClient: httpClient,
      url: url,
    );
    params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
  });

  test('should call HttpClient with correct values', () async {
    await sut.auth(params);

    verify(
      httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret},
      ),
    );
  });
}
