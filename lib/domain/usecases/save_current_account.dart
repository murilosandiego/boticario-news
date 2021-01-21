import 'package:mesa_news/domain/entities/account.dart';

abstract class SaveCurrentAccount {
  Future<void> save(Account account);
}
