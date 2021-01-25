import 'package:boticario_news/domain/usecases/add_account.dart';
import 'package:boticario_news/ui/pages/signup/signup_presenter.dart';
import 'package:faker/faker.dart';
import 'package:boticario_news/domain/entities/account_entity.dart';
import 'package:boticario_news/domain/errors/domain_error.dart';

import 'package:boticario_news/domain/usecases/save_current_account.dart';
import 'package:boticario_news/ui/helpers/ui_error.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class AddAccountMock extends Mock implements AddAccount {}

class SaveCurrentAccountSpy extends Mock implements SaveCurrentAccount {}

void main() {
  SignUpPresenter sut;
  AddAccountMock authentication;
  SaveCurrentAccountSpy saveCurrentAccount;
  String email;
  String password;
  String name;

  setUp(() {
    authentication = AddAccountMock();
    saveCurrentAccount = SaveCurrentAccountSpy();
    sut = SignUpPresenter(
      addAccount: authentication,
      saveCurrentAccount: saveCurrentAccount,
    );
    email = faker.internet.email();
    password = faker.internet.password();
    name = faker.person.name();
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

  group('validateName', () {
    test('Should emit requiredFieldError if name is empty', () {
      const name = '';

      sut.handleName(name);

      expect(sut.nameError, UIError.requiredField);
    });

    test('Should emit null if password is null', () {
      String name;
      sut.handleName(name);

      expect(sut.nameError, null);
    });

    test('Should emit null if has password', () {
      String name = faker.person.name();
      sut.handleName(name);

      expect(sut.nameError, null);
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

  group('AddAccount use case', () {
    test('Should call AddAcount with correct values', () async {
      sut.handleEmail(email);
      sut.handlePassword(password);
      sut.handleName(name);

      await sut.add();

      verify(authentication.add(AddAccountParams(
        email: email,
        secret: password,
        name: name,
      ))).called(1);
    });

    test('Should emit UIError.unexpected if credencials invalid', () async {
      when(authentication.add(any)).thenThrow(DomainError.invalidCredentials);

      await sut.add();

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
      when(authentication.add(any)).thenAnswer((_) async => account);

      await sut.add();

      verify(saveCurrentAccount.save(account)).called(1);
    });

    test('Should emit UIError.unexpected if SaveCurrentAccount fails',
        () async {
      when(authentication.add(any)).thenAnswer((_) async => account);
      when(saveCurrentAccount.save(any)).thenThrow(DomainError.unexpected);

      await sut.add();

      expect(sut.mainError, UIError.unexpected);
    });
  });
}
