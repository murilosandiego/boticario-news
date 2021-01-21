import 'package:faker/faker.dart';
import 'package:mesa_news/infra/storage/local_storage_adater.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:localstorage/localstorage.dart' as LocalStorageLib;

class LocalStorageSpy extends Mock implements LocalStorageLib.LocalStorage {}

main() {
  LocalStorageSpy localStorage;
  LocalStorageAdapter sut;
  String key;
  String value;

  setUp(() {
    localStorage = LocalStorageSpy();
    sut = LocalStorageAdapter(localStorage: localStorage);

    key = faker.randomGenerator.string(4);
    value = faker.randomGenerator.string(10);
  });

  test('Should call LocalStorage with correct values', () async {
    await sut.save(key: key, value: value);

    verify(localStorage.setItem(key, value));
  });

  test('Should throw Exception if LocalStorage fails', () {
    when(localStorage.setItem(any, any)).thenThrow(Exception());

    final future = sut.save(key: key, value: value);

    expect(future, throwsA(TypeMatcher<Exception>()));
  });
}
