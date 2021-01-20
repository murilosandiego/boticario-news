import 'package:faker/faker.dart';
import 'package:mesa_news/application/http/http_client.dart';
import 'package:mesa_news/application/http/http_error.dart';
import 'package:mesa_news/application/usecases/remote_authentication.dart';
import 'package:mesa_news/domain/errors/domain_error.dart';
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
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer((_) async => {"token": "token"});

    await sut.auth(params);

    verify(
      httpClient.request(
        url: url,
        method: 'post',
        body: {'email': params.email, 'password': params.secret},
      ),
    );
  });

  test('should throw UnexpectedError if HttpClient returns 400', () {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.badRequest);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError if HttpClient returns 404', () {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.notFound);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw UnexpectedError if HttpClient returns 500', () {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.serverError);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should throw InvalidCredentialsError if HttpClient returns 401', () {
    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenThrow(HttpError.unauthorized);

    final future = sut.auth(params);

    expect(future, throwsA(DomainError.invalidCredentials));
  });

  test('should return an Account if HttpClient returns 200', () async {
    final token = faker.guid.guid();
    final apiResult = {"token": token};

    when(httpClient.request(
            url: anyNamed('url'),
            method: anyNamed('method'),
            body: anyNamed('body')))
        .thenAnswer(
      (_) async => apiResult,
    );

    final account = await sut.auth(params);

    expect(account.token, token);
  });
}
