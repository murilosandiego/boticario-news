import '../entities/account.dart';

abstract class SaveCurrentAccount {
  Future<void> save(Account account);
}
