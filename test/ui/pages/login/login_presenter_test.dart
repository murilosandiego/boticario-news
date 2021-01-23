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

void main() {
  LoginPresenter sut;
  AutheticationMock authentication;
  SaveCurrentAccountSpy saveCurrentAccount;
  String email;
  String password;

  setUp(() {
    authentication = AutheticationMock();
    saveCurrentAccount = SaveCurrentAccountSpy();
    sut = LoginPresenter(
      authetication: authentication,
      saveCurrentAccount: saveCurrentAccount,
    );
    email = faker.internet.email();
    password = faker.internet.password();
  });

  group('validateEmail', () {
    test('Should emit requiredFieldError if email is empty', () {
      const email = '';
      sut.handleEmail(email);

      expect(sut.emailError, UIError.requiredField);
    });

    test('Should emit null if email is null', () {
      String email;
      sut.handleEmail(email);

      expect(sut.emailError, null);
    });

    test('Should emit invalidEmail if email is invalid', () {
      String email = 'asdf';
      sut.handleEmail(email);

      expect(sut.emailError, UIError.invalidEmail);
    });

    test('Should emit null if validation succeeds', () {
      String email = faker.internet.email();
      sut.handleEmail(email);

      expect(sut.emailError, null);
    });
  });

  group('validatePassword', () {
    test('Should emit requiredFieldError if password is empty', () {
      const password = '';

      sut.handlePassword(password);

      expect(sut.passwordError, UIError.requiredField);
    });

    test('Should emit null if password is null', () {
      String password;
      sut.handlePassword(password);

      expect(sut.passwordError, null);
    });

    test('Should emit null if has password', () {
      String password = faker.internet.password();
      sut.handlePassword(password);

      expect(sut.passwordError, null);
    });
  });

  group('validateForm', () {
    test('Should emits false if any field is invalid', () {
      const email = 'asd';
      sut.handleEmail(email);

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
    AccountEntity account;

    setUp(() {
      token = faker.guid.guid();
      account = AccountEntity(token: token);
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
