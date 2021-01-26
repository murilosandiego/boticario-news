import 'package:boticario_news/domain/usecases/add_account.dart';
import 'package:boticario_news/ui/helpers/user_session.dart';
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

class UserSessionSpy extends Mock implements UserSession {}

void main() {
  SignUpPresenter sut;
  AddAccountMock addAccount;
  SaveCurrentAccountSpy saveCurrentAccount;
  UserSessionSpy userSession;
  String email;
  String password;
  String name;

  setUp(() {
    addAccount = AddAccountMock();
    saveCurrentAccount = SaveCurrentAccountSpy();
    userSession = UserSessionSpy();
    sut = SignUpPresenter(
      addAccount: addAccount,
      saveCurrentAccount: saveCurrentAccount,
      userSession: userSession,
    );
    email = faker.internet.email();
    password = faker.internet.password();
    name = faker.person.name();
  });

  group('isFormValid', () {
    test('Should returns false if name is null', () {
      sut.handleEmail(email);
      sut.handlePassword(password);

      expect(sut.isFormValid, false);
    });

    test('Should returns false if name is empty', () {
      sut.handleName('');
      sut.handleEmail(email);
      sut.handlePassword(password);

      expect(sut.isFormValid, false);
    });

    test('Should returns false if email is null', () {
      sut.handleName(name);
      sut.handlePassword(password);

      expect(sut.isFormValid, false);
    });

    test('Should returns false if email is not valid', () {
      sut.handleName(name);
      sut.handleEmail('as');
      sut.handlePassword(password);

      expect(sut.isFormValid, false);
    });

    test('Should returns false if password is null', () {
      sut.handleName(name);
      sut.handleEmail(email);

      expect(sut.isFormValid, false);
    });

    test('Should returns false if password is empty', () {
      sut.handleName(name);
      sut.handleEmail(email);
      sut.handlePassword('');

      expect(sut.isFormValid, false);
    });

    test('Should returns true if all field is valid', () {
      sut.handleName(name);
      sut.handleEmail(email);
      sut.handlePassword(password);

      expect(sut.isFormValid, true);
    });
  });

  group('AddAccount use case', () {
    test('Should call AddAcount with correct values', () async {
      when(addAccount.add(any)).thenAnswer((_) async =>
          AccountEntity(token: 'token', id: 123, username: 'user'));

      sut.handleEmail(email);
      sut.handlePassword(password);
      sut.handleName(name);

      await sut.add();

      verify(addAccount.add(AddAccountParams(
        email: email,
        secret: password,
        name: name,
      ))).called(1);
    });

    test('Should emit UIError.unexpected if credencials invalid', () async {
      when(addAccount.add(any)).thenThrow(DomainError.invalidCredentials);

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
      when(addAccount.add(any)).thenAnswer((_) async => account);

      await sut.add();

      verify(saveCurrentAccount.save(account)).called(1);
    });

    test('Should emit UIError.unexpected if SaveCurrentAccount fails',
        () async {
      when(addAccount.add(any)).thenAnswer((_) async => account);
      when(saveCurrentAccount.save(any)).thenThrow(DomainError.unexpected);

      await sut.add();

      expect(sut.mainError, UIError.unexpected);
    });
  });
}
