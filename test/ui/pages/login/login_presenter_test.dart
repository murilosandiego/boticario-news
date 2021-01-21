import 'package:faker/faker.dart';
import 'package:mesa_news/domain/usecases/authentication.dart';
import 'package:mesa_news/ui/helpers/errors/ui_error.dart';
import 'package:mesa_news/ui/pages/login/login_presenter.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class AutheticationMock extends Mock implements Authetication {}

void main() {
  LoginPresenter sut;
  AutheticationMock authentication;

  setUp(() {
    authentication = AutheticationMock();
    sut = LoginPresenter(authetication: authentication);
  });

  group('validateEmail', () {
    test('Should emit requiredFieldError if email is empty', () {
      const email = '';
      sut.validateEmail(email);

      expect(sut.emailError, UIError.requiredField);
    });

    test('Should emit null if email is null', () {
      String email;
      sut.validateEmail(email);

      expect(sut.emailError, null);
    });

    test('Should emit invalidEmail if email is invalid', () {
      String email = 'asdf';
      sut.validateEmail(email);

      expect(sut.emailError, UIError.invalidEmail);
    });

    test('Should emit null if validation succeeds', () {
      String email = faker.internet.email();
      sut.validateEmail(email);

      expect(sut.emailError, null);
    });
  });

  group('validatePassword', () {
    test('Should emit requiredFieldError if password is empty', () {
      const password = '';

      sut.validatePassword(password);

      expect(sut.passwordError, UIError.requiredField);
    });

    test('Should emit null if password is null', () {
      String password;
      sut.validatePassword(password);

      expect(sut.passwordError, null);
    });

    test('Should emit null if has password', () {
      String password = faker.internet.password();
      sut.validatePassword(password);

      expect(sut.passwordError, null);
    });
  });

  group('validateForm', () {
    test('Should emits false if any field is invalid', () {
      const email = 'asd';
      sut.validateEmail(email);

      expect(sut.isFormValid, false);
    });

    test('Should emits true if all field is valid', () {
      final email = faker.internet.email();
      final password = faker.internet.password();

      sut.validateEmail(email);
      sut.validatePassword(password);

      expect(sut.isFormValid, true);
    });
  });

  group('Authentication', () {
    test('Should call Authentication with correct values', () async {
      when(authentication.auth(AuthenticationParams(
              email: anyNamed('email'), secret: anyNamed('secret'))))
          .thenAnswer((_) => null);

      final email = faker.internet.email();
      final password = faker.internet.password();

      sut.validateEmail(email);
      sut.validatePassword(password);

      await sut.auth();

      verify(authentication
              .auth(AuthenticationParams(email: email, secret: password)))
          .called(1);
    });
  });
}
