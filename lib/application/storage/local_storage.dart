import 'package:meta/meta.dart';

abstract class LocalStorage {
  Future<void> save({@required String key, @required String value});
  Future fetch({@required String key});
}
