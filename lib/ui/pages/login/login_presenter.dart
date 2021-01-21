import 'package:get/get.dart';
import 'package:mesa_news/ui/helpers/errors/ui_error.dart';
import '../../../domain/usecases/authentication.dart';
import 'package:meta/meta.dart';

class LoginPresenter extends GetxController {
  final Authetication authetication;

  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();

  UIError get passwordError => _passwordError.value;
  UIError get emailError => _emailError.value;

  String _email;
  String _password;

  LoginPresenter({@required this.authetication});

  handleEmail(String email) {
    _email = email;
    _validateEmail(email);
  }

  void handlePassword(String password) {
    _password = password;
    _validatePassword(password);
  }

  auth() async {
    try {
      final account = await authetication
          .auth(AuthenticationParams(email: _email, secret: _password));
      print(account);
    } catch (error) {
      print(error);
    }
  }

  bool get isFormValid =>
      _emailError.value == null &&
      _passwordError.value == null &&
      _email != null &&
      _password != null;

  _validateEmail(String email) {
    if (email == null) {
      _emailError.value = null;
      return;
    }

    if (email?.isEmpty == true) {
      _emailError.value = UIError.requiredField;
      return;
    }

    _emailError.value = email?.isEmail == true ? null : UIError.invalidEmail;
  }

  _validatePassword(String password) {
    _passwordError.value =
        password?.isEmpty == true ? UIError.requiredField : null;
  }
}
