import 'package:boticario_news/ui/helpers/ui_error.dart';
import 'package:get/get.dart';

class Validator {
  static UIError emailField(String field) {
    if (field == null) {
      return null;
    }

    if (field.isEmpty == true) {
      return UIError.requiredField;
    }

    return field.isEmail == true ? null : UIError.invalidEmail;
  }

  static UIError requiredField(String field) {
    return field?.isEmpty == true ? UIError.requiredField : null;
  }
}
