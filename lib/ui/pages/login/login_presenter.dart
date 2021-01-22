import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/authentication.dart';
import '../../../domain/usecases/save_current_account.dart';
import '../../../main/pages/app_pages.dart';
import '../../helpers/app_snackbar.dart';
import '../../helpers/ui_error.dart';

class LoginPresenter extends GetxController {
  final Authetication authetication;
  final SaveCurrentAccount saveCurrentAccount;

  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();
  final _isLoading = false.obs;
  final _navigateTo = RxString();
  final _mainError = Rx<UIError>();

  UIError get passwordError => _passwordError.value;
  UIError get emailError => _emailError.value;
  UIError get mainError => _mainError.value;
  bool get isLoading => _isLoading.value;

  String _email;
  String _password;

  LoginPresenter(
      {@required this.saveCurrentAccount, @required this.authetication});

  Worker _navigationWorker;
  Worker _mainErrorWorker;

  @override
  void onInit() {
    super.onInit();
    _handleNavigation();
    _handleMainError();
  }

  void handleEmail(String email) {
    _email = email;
    _validateEmail(email);
  }

  void handlePassword(String password) {
    _password = password;
    _validatePassword(password);
  }

  auth() async {
    try {
      _isLoading.value = true;

      final account = await authetication
          .auth(AuthenticationParams(email: _email, secret: _password));

      await saveCurrentAccount.save(account);

      _navigateTo.value = AppPages.welcome;
    } on DomainError catch (error) {
      _mainError.update((_) {});
      if (error == DomainError.invalidCredentials) {
        _mainError.value = UIError.invalidCredentials;
        return;
      }

      _mainError.value = UIError.unexpected;
    } finally {
      _isLoading.value = false;
    }
  }

  bool get isFormValid =>
      _emailError.value == null &&
      _passwordError.value == null &&
      _email != null &&
      _password != null;

  void _handleNavigation() {
    _navigationWorker = ever(_navigateTo, (_) {
      Get.offAndToNamed(AppPages.welcome);
    });
  }

  void _handleMainError() {
    _mainErrorWorker = ever<UIError>(_mainError, (error) {
      if (error == null) return;

      AppSnackbar.showError(message: error.description);
    });
  }

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

  @override
  void onClose() {
    super.onClose();
    _navigationWorker.dispose();
    _mainErrorWorker.dispose();
  }
}
