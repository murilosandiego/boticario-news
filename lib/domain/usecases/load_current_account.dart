import '../entities/account.dart';

abstract class LoadCurrentAccount {
  Future<Account> load();
}
