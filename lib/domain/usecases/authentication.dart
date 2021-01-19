import 'package:meta/meta.dart' show required;

import '../entities/account.dart';

abstract class Authetication {
  Future<Account> call({@required email, @required String password});
}
