import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class UserSession extends GetxController {
  static UserSession get to => Get.find();
  String _name;
  int _id;

  void saveUser({
    @required String name,
    @required int id,
  }) {
    _name = name;
    _id = id;
    update();
  }

  void clear() {
    _name = null;
    _id = null;
    update();
  }

  String get name => _name;
  int get id => _id;
}
