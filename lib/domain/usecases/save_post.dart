import 'package:meta/meta.dart';

abstract class SavePost {
  Future<void> save({@required String message});
}
