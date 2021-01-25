import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/errors/domain_error.dart';
import '../../../domain/usecases/add_account.dart';
import '../../../domain/usecases/save_current_account.dart';
import '../../../main/pages/app_pages.dart';
import '../../helpers/app_snackbar.dart';
import '../../helpers/ui_error.dart';

class SignUpPresenter extends GetxController {
  final AddAccount addAccount;
  final SaveCurrentAccount saveCurrentAccount;

  final _nameError = Rx<UIError>();
  final _emailError = Rx<UIError>();
  final _passwordError = Rx<UIError>();
  final _isLoading = false.obs;
  final _navigateTo = RxString();
  final _mainError = Rx<UIError>();

  UIError get nameError => _nameError.value;
  UIError get passwordError => _passwordError.value;
  UIError get emailError => _emailError.value;
  UIError get mainError => _mainError.value;
  bool get isLoading => _isLoading.value;

  String _name;
  String _email;
  String _password;

  SignUpPresenter({
    @required this.saveCurrentAccount,
    @required this.addAccount,
  });

  Worker _navigationWorker;
  Worker _mainErrorWorker;

  @override
  void onInit() {
    super.onInit();
    _handleNavigation();
    _handleMainError();
  }

  void handleName(String name) {
    _name = name;
    _validateName(name);
  }

  void handleEmail(String email) {
    _email = email;
    _validateEmail(email);
  }

  void handlePassword(String password) {
    _password = password;
    _validatePassword(password);
  }

  add() async {
    try {
      _isLoading.value = true;

      final account = await addAccount.add(AddAccountParams(
        email: _email,
        secret: _password,
        name: _name,
      ));

      await saveCurrentAccount.save(account);

      _navigateTo.value = AppPages.feed;
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
      _nameError.value == null &&
      _passwordError.value == null &&
      _email != null &&
      _password != null &&
      _name != null;

  void _handleNavigation() {
    _navigationWorker = ever(_navigateTo, (page) {
      Get.offAllNamed(page);
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

  _validateName(String name) {
    _nameError.value = name?.isEmpty == true ? UIError.requiredField : null;
  }

  @override
  void onClose() {
    super.onClose();
    _navigationWorker.dispose();
    _mainErrorWorker.dispose();
  }
}
