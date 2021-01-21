import 'package:meta/meta.dart';

abstract class LocalStorage {
  Future<void> save({@required key, @required value});
}
