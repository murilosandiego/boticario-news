import 'package:faker/faker.dart';
import 'package:mesa_news/application/storage/local_storage.dart';
import 'package:mesa_news/application/usecases/local_load_current_account.dart';
import 'package:mesa_news/domain/entities/account.dart';
import 'package:mesa_news/domain/errors/domain_error.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class LocalStorageSpy extends Mock implements LocalStorage {}

void main() {
  LocalStorageSpy localStorage;
  LocalLoadCurrentAccount sut;
  String token;

  setUp(() {
    localStorage = LocalStorageSpy();
    sut = LocalLoadCurrentAccount(localStorage: localStorage);
    token = faker.guid.guid();
  });

  test('Should call LocalStorage with currect value', () async {
    await sut.load();

    verify(localStorage.fetch(key: 'token'));
  });

  test('Shoud return an AccountEntity', () async {
    when(localStorage.fetch(key: anyNamed('key')))
        .thenAnswer((_) async => token);

    final account = await sut.load();

    expect(account, Account(token: token));
  });

  test('Shoud throw DomainError.unexpected if LocalStorage throws', () {
    when(localStorage.fetch(key: anyNamed('key')))
        .thenThrow(DomainError.unexpected);

    final future = sut.load();

    expect(future, throwsA(DomainError.unexpected));
  });
}
