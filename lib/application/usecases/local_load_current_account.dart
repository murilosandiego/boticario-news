import 'dart:convert';

import 'package:meta/meta.dart';

import '../../domain/entities/account_entity.dart';
import '../../domain/errors/domain_error.dart';
import '../../domain/usecases/load_current_account.dart';
import '../models/account_model.dart';
import '../storage/local_storage.dart';

class LocalLoadCurrentAccount implements LoadCurrentAccount {
  final LocalStorage localStorage;

  LocalLoadCurrentAccount({@required this.localStorage});
  @override
  Future<AccountEntity> load() async {
    try {
      final resultFetched = await localStorage.fetch(key: 'account');
      return AccountModel.fromLocalStorage(jsonDecode(resultFetched))
          .toEntity();
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
