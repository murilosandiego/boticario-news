import 'package:get/get.dart';
import '../../../domain/usecases/authentication.dart';
import 'package:meta/meta.dart';

class LoginPresenter extends GetxController {
  static LoginPresenter get to => Get.find();
  final Authetication authetication;

  final _emailError = RxString();
  final _passwordError = RxString();

  String get emailError => _emailError.value;

  String _email;
  String _passoword;

  LoginPresenter({@required this.authetication});

  validateEmail(String email) {
    _email = email;
    _emailError.value = _email.isEmpty ? 'Email Obrigatório' : null;
  }
}
