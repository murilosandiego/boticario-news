import 'package:boticario_news/ui/helpers/user_session.dart';
import 'package:faker/faker.dart';
import 'package:boticario_news/domain/entities/account_entity.dart';
import 'package:boticario_news/domain/errors/domain_error.dart';

import 'package:boticario_news/domain/usecases/authentication.dart';
import 'package:boticario_news/domain/usecases/save_current_account.dart';
import 'package:boticario_news/ui/helpers/ui_error.dart';
import 'package:boticario_news/ui/pages/login/login_presenter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class AutheticationMock extends Mock implements Authetication {}

class SaveCurrentAccountSpy extends Mock implements SaveCurrentAccount {}

class UserSessionSpy extends Mock implements UserSession {}

void main() {
  LoginPresenter sut;
  AutheticationMock authentication;
  SaveCurrentAccountSpy saveCurrentAccount;
  UserSessionSpy userSessionSpy;

  String email;
  String password;

  setUp(() {
    authentication = AutheticationMock();
    saveCurrentAccount = SaveCurrentAccountSpy();
    userSessionSpy = UserSessionSpy();

    sut = LoginPresenter(
        authetication: authentication,
        saveCurrentAccount: saveCurrentAccount,
        userSession: userSessionSpy);

    email = faker.internet.email();
    password = faker.internet.password();
  });

  group('isFormValid', () {
    test('Should return false if email is invalid', () {
      const email = 'asd';
      sut.handleEmail(email);

      expect(sut.isFormValid, false);
    });

    test('Should return false if password is null', () {
      String password;
      sut.handlePassword(password);

      expect(sut.isFormValid, false);
    });

    test('Should emits true if all field is valid', () {
      sut.handleEmail(email);
      sut.handlePassword(password);

      expect(sut.isFormValid, true);
    });
  });

  group('Authentication use case', () {
    test('Should call Authentication with correct values', () async {
      when(authentication.auth(any)).thenAnswer((_) async =>
          AccountEntity(token: 'token', id: 123, username: 'user'));

      sut.handleEmail(email);
      sut.handlePassword(password);

      await sut.auth();

      verify(authentication
              .auth(AuthenticationParams(email: email, secret: password)))
          .called(1);
    });

    test('Should emit UIError.unexpected if credencials invalid', () async {
      when(authentication.auth(any)).thenThrow(DomainError.invalidCredentials);

      await sut.auth();

      expect(sut.mainError, UIError.invalidCredentials);
    });
  });

  group('SaveCurrentAccount use case', () {
    String token;
    String username;
    int id;
    AccountEntity account;

    setUp(() {
      token = faker.guid.guid();
      username = faker.person.name();
      id = faker.randomGenerator.integer(2);

      account = AccountEntity(
        token: token,
        username: username,
        id: id,
      );
    });

    test('Should call SaveCurrentAccount with correct values', () async {
      when(authentication.auth(any)).thenAnswer((_) async => account);

      await sut.auth();

      verify(saveCurrentAccount.save(account)).called(1);
    });

    test('Should emit UIError.unexpected if SaveCurrentAccount fails',
        () async {
      when(authentication.auth(any)).thenAnswer((_) async => account);
      when(saveCurrentAccount.save(any)).thenThrow(DomainError.unexpected);

      await sut.auth();

      expect(sut.mainError, UIError.unexpected);
    });
  });
}
